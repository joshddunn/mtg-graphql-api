require 'json'

file = File.read('db/data/3.12.8.json')
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

data_hash.each do |key, value|
  value.each do |set_key, set_value|
    set_keys.push set_key unless set_keys.include? set_key
  end

  # blocks
  if value[:block].present?
    blocks.push value[:block] unless blocks.include? value[:block] 
  end

  # card_descriptions
  if value[:booster].present? 
    value[:booster].each do |booster|
      if booster.kind_of? Array
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
    card.each do |card_key, card_value|
      card_keys.push card_key unless card_keys.include? card_key
    end

    # supertypes
    if card[:supertypes].kind_of? Array
      card[:supertypes].each do |supertype|
        supertypes.push supertype unless supertypes.include? supertype 
      end
    end

    # artist
    artists.push card[:artist] unless artists.include? card[:artist] 

    # subtypes
    if card[:subtypes].kind_of? Array
      card[:subtypes].each do |subtype|
        subtypes.push subtype unless subtypes.include? subtype 
      end
    end

    # types
    if card[:types].kind_of? Array
      card[:types].each do |type|
        types.push type unless types.include? type 
      end
    end

    # colors
    if card[:colors].kind_of? Array
      card[:colors].each do |color|
        colors.push color unless colors.include? color 
      end
    end

    # color identity
    if card[:colorIdentity].kind_of? Array
      card[:colorIdentity].each do |color_identity|
        color_identities.push color_identity unless color_identities.include? color_identity 
      end
    end
  end
end


supertypes.sort.each_with_index do |supertype, i|
  Supertype.create(id: i+1, identifier: supertype)
end

artists.sort.each_with_index do |artist, i|
  Artist.create(id: i+1, identifier: artist)
end

subtypes.sort.each_with_index do |subtype, i|
  Subtype.create(id: i+1, identifier: subtype)
end

types.sort.each_with_index do |type, i|
  Type.create(id: i+1, identifier: type)
end

colors.sort.each_with_index do |color, i|
  Color.create(id: i+1, identifier: color)
end

color_identities.sort.each_with_index do |color_identity, i|
  ColorIdentity.create(id: i+1, identifier: color_identity)
end

blocks.sort.each_with_index do |block, i|
  Block.create(id: i+1, identifier: block)
end

card_descriptions.sort.each_with_index do |description, i|
  CardDescription.create(id: i+1, identifier: description)
end

puts "Phase 1 seeding is complete"

data_hash.each do |key, value|
  set = MagicSet.create(
    name: value[:name],
    code: value[:code],
    release_date: value[:releaseDate],
    border: value[:border],
    set_type: value[:type],
    mkm_name: value[:mkm_name],
    mkm_id: value[:mkm_id],
    magic_cards_info_code: value[:magicCardsInfoCode],
    gatherer_code: value[:gathererCode],
    old_code: value[:oldCode],
    online_only: value[:onlineOnly],
    block_id: value[:block].present? ? Block.where(identifier: value[:block]).first.id : nil
  )

  # enter in booster information
  if value[:booster].present?
    value[:booster].each_with_index do |v, index|
      if v.kind_of? Array
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
  if value[:alternativeNames].present?
    value[:alternativeNames].each do |name|
      AlternativeName.new(magic_set_id: set.id, identifier: name).save!
    end
  end

  # magic rarities code
  if value[:magicRaritiesCodes].present?
    value[:magicRaritiesCodes].each do |code|
      MagicRaritiesCode.new(magic_set_id: set.id, identifier: code).save!
    end
  end

  # translation
  if value[:translations].present?
    value[:translations].each do |code, identifier|
      Translation.new(magic_set_id: set.id, code: code, identifier: identifier).save!
    end
  end

  # cards
  value[:cards].each do |card|
    info = Card.create(
      identifier: card[:id],
      magic_set_id: set.id,
      artist_id: Artist.where(identifier: card[:artist]).first.id,
      cmc: card[:cmc],
      multiverseid: card[:multiverseid],
      image_name: card[:imageName],
      layout: card[:layout],
      mana_cost: card[:mana_cost],
      name: card[:name],
      number: card[:number],
      power: card[:power],
      rarity: card[:rarity],
      text: card[:text],
      toughness: card[:toughness],
      card_type: card[:type],
      watermark: card[:watermark],
      flavor: card[:flavor],
      mci_number: card[:mciNumber],
      border: card[:border],
      release_date: card[:releaseDate],
      loyalty: card[:loyalty],
      reserved: card[:reserved] ? true : false,
      hand: card[:hand],
      life: card[:life],
      timeshifted: card[:timeshifted] ? true : false, 
      starter: card[:starter] ? true : false
    )

    # color identity assoc
    if card[:colorIdentity].present?
      card[:colorIdentity].each do |color_identity|
        ColorIdentityAssociation.new(
          card_id: info.id,
          color_identity_id: ColorIdentity.where(identifier: color_identity).first.id
        ).save!
      end
    end

    # color assoc
    if card[:colors].present?
      card[:colors].each do |color|
        ColorAssociation.new(
          card_id: info.id,
          color_id: Color.where(identifier: color).first.id
        ).save!
      end
    end

    # subtype assoc
    if card[:subtypes].present?
      card[:subtypes].each do |subtype|
        SubtypeAssociation.new(
          card_id: info.id,
          subtype_id: Subtype.where(identifier: subtype).first.id
        ).save!
      end
    end

    # supertype assoc
    if card[:supertypes].present?
      card[:supertypes].each do |supertype|
        SupertypeAssociation.new(
          card_id: info.id,
          supertype_id: Supertype.where(identifier: supertype).first.id
        ).save!
      end
    end

    # type assoc
    if card[:types].present?
      card[:types].each do |type|
        TypeAssociation.new(
          card_id: info.id,
          type_id: Type.where(identifier: type).first.id
        ).save!
      end
    end

  end
end

puts "Phase 2 seeding is complete"

data_hash.each do |key, value|
  value[:cards].each do |card|
    # variation assoc
    if card[:variations].present?
      card[:variations].each do |variation|
        Variation.new(
          card_id: Card.where(identifier: card[:id]).first.id,
          variation_id: Card.where(multiverseid: variation).first.id
        ).save!
      end
    end
  end
end

puts "Phase 3 seeding is complete"
