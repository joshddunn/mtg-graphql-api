require 'json'

file = File.read('db/data/4.2.1.json')
data_hash = JSON.parse(file, symbolize_names: true)

artists = []
supertypes = []
subtypes = []
types = []
colors = []
color_identities = []
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

    # color identity
    if card[:colorIdentity].is_a? Array
      card[:colorIdentity].each do |color_identity|
        color_identities.push color_identity unless color_identities.include? color_identity
      end
    end
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

color_identities.sort.each_with_index do |color_identity, i|
  ColorIdentity.create(id: i + 1, identifier: color_identity)
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

  # alternate names
  # if value[:names].present?
  #   value[:names].each do |name|
  #     AlternativeName.new(magic_set_id: set.id, identifier: name).save!
  #   end
  # end

  # magic rarities code
  # if value[:magicRaritiesCodes].present?
  #   value[:magicRaritiesCodes].each do |code|
  #     MagicRaritiesCode.new(magic_set_id: set.id, identifier: code).save!
  #   end
  # end

  # translation
  # if value[:translations].present?
  #   value[:translations].each do |code, identifier|
  #     Translation.new(magic_set_id: set.id, code: code, identifier: identifier).save!
  #   end
  # end

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
      original_text: card[:originalText],
      original_type: card[:originalType],
      side: card[:side],
      tcgplayer_product_id: card[:tcgplayerProductId]
    )
  end
  Card.import information, validate: false

  information = []
  value[:cards].each do |card|
    # color identity assoc
    if card[:colorIdentity].present?
      info = Card.find_by(identifier: card[:uuid])
      card[:colorIdentity].each do |color_identity|
        information.push ColorIdentityAssociation.new(
          card_id: info.id,
          color_identity_id: ColorIdentity.where(identifier: color_identity).first.id
        )
      end
    end
  end
  ColorIdentityAssociation.import information, validate: false

  information = []
  value[:cards].each do |card|
    # color assoc
    if card[:colors].present?
      info = Card.find_by(identifier: card[:uuid])
      card[:colors].each do |color|
        information.push ColorAssociation.new(
          card_id: info.id,
          color_id: Color.where(identifier: color).first.id
        )
      end
    end
  end
  ColorAssociation.import information, validate: false

  information = []
  value[:cards].each do |card|
    # subtype assoc
    if card[:subtypes].present?
      info = Card.find_by(identifier: card[:uuid])
      card[:subtypes].each do |subtype|
        information.push SubtypeAssociation.new(
          card_id: info.id,
          subtype_id: Subtype.where(identifier: subtype).first.id
        )
      end
    end
  end
  SubtypeAssociation.import information, validate: false

  information = []
  value[:cards].each do |card|
    # supertype assoc
    if card[:supertypes].present?
      info = Card.find_by(identifier: card[:uuid])
      card[:supertypes].each do |supertype|
        information.push SupertypeAssociation.new(
          card_id: info.id,
          supertype_id: Supertype.where(identifier: supertype).first.id
        )
      end
    end
  end
  SupertypeAssociation.import information, validate: false

  information = []
  value[:cards].each do |card|
    # type assoc
    if card[:types].present?
      info = Card.find_by(identifier: card[:uuid])
      card[:types].each do |type|
        information.push TypeAssociation.new(
          card_id: info.id,
          type_id: Type.where(identifier: type).first.id
        )
      end
    end
  end
  TypeAssociation.import information, validate: false

  puts "#{key} (#{current} of #{total})"
  current += 1
end

puts 'Phase 2 seeding is complete'

data_hash.each do |_, value|
  information = []
  value[:cards].each do |card|
    # variation assoc
    if card[:variations].present?
      card[:variations].each do |variation|
        information.push Variation.new(
          card_id: Card.where(identifier: card[:uuid]).first.id,
          variation_id: Card.where(identifier: variation).first.id
        )
      end
    end
  end
  Variation.import information, validate: false
end

puts 'Phase 3 seeding is complete'
