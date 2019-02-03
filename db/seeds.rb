require 'json'
require 'pry'
require 'zip'

VERSION = '4.2.1'.freeze

file_path = "db/data/#{VERSION}.json"

File.delete(file_path) if File.exist?(file_path)

Zip::File.open("#{file_path}.zip") do |zipfile|
  zipfile.each do |file|
    file.extract(file_path)
    data_hash = JSON.parse(file.get_input_stream.read, symbolize_names: true)

    artists = []
    supertypes = []
    subtypes = []
    types = []
    colors = []
    set_keys = []
    card_keys = []
    blocks = []
    card_descriptions = []

    current = 1
    total = data_hash.count

    data_hash.each do |_, value|
      value.each do |set_key, _|
        set_keys.push set_key unless set_keys.include? set_key
      end

      # blocks
      if value[:block].present?
        blocks.push value[:block] unless blocks.include? value[:block]
      end

      # card_descriptions
      if value[:boosterV3].present?
        value[:boosterV3].each do |booster|
          if booster.is_a? Array
            booster.each do |b|
              card_descriptions.push b unless card_descriptions.include? b
            end
          else
            card_descriptions.push booster unless card_descriptions.include? booster
          end
        end
      end

      value[:cards].each do |card|
        # card keys
        card.each do |card_key, _|
          card_keys.push card_key unless card_keys.include? card_key
        end

        # supertypes
        if card[:supertypes].is_a? Array
          card[:supertypes].each do |supertype|
            supertypes.push supertype unless supertypes.include? supertype
          end
        end

        # artist
        artists.push card[:artist] unless artists.include? card[:artist]

        # subtypes
        if card[:subtypes].is_a? Array
          card[:subtypes].each do |subtype|
            subtypes.push subtype unless subtypes.include? subtype
          end
        end

        # types
        if card[:types].is_a? Array
          card[:types].each do |type|
            types.push type unless types.include? type
          end
        end

        # colors
        if card[:colors].is_a? Array
          card[:colors].each do |color|
            colors.push color unless colors.include? color
          end
        end
      end

      value[:tokens].each do |card|
        artists.push card[:artist] if card[:artist] && !artists.include?(card[:artist])
      end
    end

    supertypes.sort.each_with_index do |supertype, i|
      Supertype.create(id: i + 1, identifier: supertype)
    end

    artists.sort.each_with_index do |artist, i|
      Artist.create(id: i + 1, identifier: artist)
    end

    subtypes.sort.each_with_index do |subtype, i|
      Subtype.create(id: i + 1, identifier: subtype)
    end

    types.sort.each_with_index do |type, i|
      Type.create(id: i + 1, identifier: type)
    end

    colors.sort.each_with_index do |color, i|
      Color.create(id: i + 1, identifier: color)
    end

    blocks.sort.each_with_index do |block, i|
      Block.create(id: i + 1, identifier: block)
    end

    card_descriptions.sort.each_with_index do |description, i|
      CardDescription.create(id: i + 1, identifier: description)
    end

    puts 'Phase 1 seeding is complete'

    data_hash.each do |key, value|
      set = MagicSet.create(
        name: value[:name],
        code: value[:code],
        code_v3: value[:codeV3],
        release_date: value[:releaseDate],
        set_type: value[:type],
        is_online_only: value[:isOnlineOnly] ? true : false,
        is_foil_only: value[:isFoilOnly] ? true : false,
        base_set_size: value[:baseSetSize],
        meta_date: value.dig(:meta, :date),
        meta_version: value.dig(:meta, :version),
        mtgo_code: value[:mtgoCode],
        tcgplayer_group_id: value[:tcgplayerGroupId],
        total_set_size: value[:totalSetSize],
        block_id: value[:block].present? ? Block.where(identifier: value[:block]).first.id : nil
      )

      # enter in booster information
      if value[:boosterV3].present?
        value[:boosterV3].each_with_index do |v, index|
          if v.is_a? Array
            v.each do |vv|
              Booster.new(magic_set_id: set.id, position: index + 1,
                          card_description_id: CardDescription.where(identifier: vv).first.id).save!
            end
          else
            Booster.new(magic_set_id: set.id, position: index + 1,
                        card_description_id: CardDescription.where(identifier: v).first.id).save!
          end
        end
      end

      # cards
      information = value[:cards].map do |card|
        Card.new(
          identifier: card[:uuid],
          magic_set_id: set.id,
          artist_id: Artist.where(identifier: card[:artist]).first.id,
          converted_mana_cost: card[:convertedManaCost],
          layout: card[:layout],
          mana_cost: card[:manaCost],
          name: card[:name],
          number: card[:number],
          power: card[:power],
          rarity: card[:rarity],
          text: card[:text],
          toughness: card[:toughness],
          card_type: card[:type],
          watermark: card[:watermark],
          flavor_text: card[:flavorText],
          border_color: card[:borderColor],
          loyalty: card[:loyalty],
          is_reserved: card[:isReserved] ? true : false,
          hand: card[:hand],
          life: card[:life],
          is_timeshifted: card[:isTimeshifted] ? true : false,
          starter: card[:starter] ? true : false,
          duel_deck: card[:duelDeck],
          face_converted_mana_cost: card[:faceConvertedManaCost],
          frame_effect: card[:frameEffect],
          frame_version: card[:frameVersion],
          has_foil: card[:hasFoil] ? true : false,
          has_non_foil: card[:hasNonFoil] ? true : false,
          is_alternate: card[:isAlternate] ? true : false,
          is_foil_only: card[:isFoilOnly] ? true : false,
          is_online_only: card[:isOnlineOnly] ? true : false,
          is_oversized: card[:isOversized] ? true : false,
          legalities: card[:legalities],
          names: card[:names],
          original_text: card[:originalText],
          original_type: card[:originalType],
          side: card[:side],
          tcgplayer_product_id: card[:tcgplayerProductId],
          scryfall_id: card[:scryfallId]
        )
      end
      Card.import information, validate: false

      color_identity_information = []
      color_indicator_information = []
      color_information = []
      subtype_information = []
      supertype_information = []
      type_information = []
      ruling_information = []
      foreign_datum_information = []

      information = value[:tokens].map do |token|
        Token.new(
          identifier: token[:uuid],
          magic_set_id: set.id,
          artist_id: Artist.where(identifier: token[:artist]).first&.id,
          border_color: token[:borderColor],
          is_online_only: token[:isOnlineOnly] ? true : false,
          loyalty: token[:loyalty],
          name: token[:name],
          number: token[:number],
          power: token[:power],
          scryfall_id: token[:scryfallId],
          side: token[:side],
          text: token[:text],
          toughness: token[:toughness],
          token_type: token[:type],
          watermark: token[:watermark]
        )
      end
      Token.import information, validate: false

      value[:cards].each do |card|
        # color identity assoc
        if card[:colorIdentity].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:colorIdentity].each do |color_identity|
            color_identity_information.push ColorIdentityAssociation.new(
              card_id: info.id,
              color_id: Color.where(identifier: color_identity).first.id
            )
          end
        end

        # color indicator assoc
        if card[:colorIndicator].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:colorIndicator].each do |color_indicator|
            color_indicator_information.push ColorIndicatorAssociation.new(
              card_id: info.id,
              color_id: Color.where(identifier: color_indicator).first.id
            )
          end
        end

        # color assoc
        if card[:colors].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:colors].each do |color|
            color_information.push ColorAssociation.new(
              card_id: info.id,
              color_id: Color.where(identifier: color).first.id
            )
          end
        end

        # subtype assoc
        if card[:subtypes].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:subtypes].each do |subtype|
            subtype_information.push SubtypeAssociation.new(
              card_id: info.id,
              subtype_id: Subtype.where(identifier: subtype).first.id
            )
          end
        end

        # supertype assoc
        if card[:supertypes].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:supertypes].each do |supertype|
            supertype_information.push SupertypeAssociation.new(
              card_id: info.id,
              supertype_id: Supertype.where(identifier: supertype).first.id
            )
          end
        end

        # type assoc
        if card[:types].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:types].each do |type|
            type_information.push TypeAssociation.new(
              card_id: info.id,
              type_id: Type.where(identifier: type).first.id
            )
          end
        end

        # ruling assoc
        if card[:rulings].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:rulings].each do |ruling|
            ruling_information.push Ruling.new(
              card_id: info.id,
              date: ruling[:date],
              text: ruling[:text]
            )
          end
        end

        # foreign datum assoc
        if card[:foreignData].present?
          info = Card.find_by(identifier: card[:uuid])
          card[:foreignData].each do |foreign_data|
            foreign_datum_information.push ForeignDatum.new(
              card_id: info.id,
              flavor_text: foreign_data[:flavorText],
              language: foreign_data[:language],
              multiverse_id: foreign_data[:multiverseId],
              name: foreign_data[:name],
              text: foreign_data[:text],
              card_type: foreign_data[:type]
            )
          end
        end
      end

      ColorIdentityAssociation.import color_identity_information, validate: false
      ColorIndicatorAssociation.import color_indicator_information, validate: false
      ColorAssociation.import color_information, validate: false
      TypeAssociation.import type_information, validate: false
      SupertypeAssociation.import supertype_information, validate: false
      SubtypeAssociation.import subtype_information, validate: false
      Ruling.import ruling_information, validate: false
      ForeignDatum.import foreign_datum_information, validate: false

      color_identity_information = []
      color_indicator_information = []
      color_information = []

      value[:tokens].each do |card|
        # color identity assoc
        if card[:colorIdentity].present?
          info = Token.find_by(identifier: card[:uuid])
          card[:colorIdentity].each do |color_identity|
            color_identity_information.push TokenColorIdentityAssociation.new(
              token_id: info.id,
              color_id: Color.where(identifier: color_identity).first.id
            )
          end
        end

        # color indicator assoc
        if card[:colorIndicator].present?
          info = Token.find_by(identifier: card[:uuid])
          card[:colorIndicator].each do |color_indicator|
            color_indicator_information.push TokenColorIndicatorAssociation.new(
              token_id: info.id,
              color_id: Color.where(identifier: color_indicator).first.id
            )
          end
        end

        # color assoc
        if card[:colors].present?
          info = Token.find_by(identifier: card[:uuid])
          card[:colors].each do |color|
            color_information.push TokenColorAssociation.new(
              token_id: info.id,
              color_id: Color.where(identifier: color).first.id
            )
          end
        end
      end
      TokenColorIdentityAssociation.import color_identity_information, validate: false
      TokenColorIndicatorAssociation.import color_indicator_information, validate: false
      TokenColorAssociation.import color_information, validate: false

      puts "P2 -- #{key} (#{current} of #{total})"
      current += 1
    end

    puts 'Phase 2 seeding is complete'

    current = 1
    data_hash.each do |key, value|
      variation_information = []
      printing_information = []

      value[:cards].each do |card|
        id = Card.where(identifier: card[:uuid]).first.id
        # variation assoc
        if card[:variations].present?
          card[:variations].each do |variation|
            variation_information.push Variation.new(
              card_id: id,
              variation_id: Card.where(identifier: variation).first.id
            )
          end
        end

        # printing assoc
        if card[:printings].present?
          card[:printings].each do |code|
            printing_information.push PrintingAssociation.new(
              card_id: id,
              magic_set_id: MagicSet.where(code: code).first.id
            )
          end
        end
      end

      Variation.import variation_information, validate: false
      PrintingAssociation.import printing_information, validate: false

      card_token_information = []
      value[:tokens].each do |card|
        # card token assoc
        if card[:reverseRelated].present?
          card[:reverseRelated].each do |name|
            # its possible for tokens to be the only reference to another token
            card_id = Card.where(name: name).first&.id
            if card_id
              card_token_information.push CardTokenAssociation.new(
                token_id: Token.where(identifier: card[:uuid]).first.id,
                card_id: card_id
              )
            end
          end
        end
      end
      CardTokenAssociation.import card_token_information, validate: false

      puts "P3 -- #{key} (#{current} of #{total})"
      current += 1
    end

    puts 'Phase 3 seeding is complete'
  end
end
