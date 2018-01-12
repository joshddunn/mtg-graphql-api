require 'json'

file = File.read('AllSets.json')
data_hash = JSON.parse(file, symbolize_names: true)

subtypes = []
types = []
colors = []
color_identities = []
set_keys = []
card_keys = []

data_hash.each do |key, value|
  value.each do |set_key, set_value|
    set_keys.push set_key unless set_keys.include? set_key
  end

  value[:cards].each do |card|
    # card keys
    card.each do |card_key, card_value|
      card_keys.push card_key unless card_keys.include? card_key
    end


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

puts set_keys
  # booster (array)
  # magic rarities codes (array)
  # translations (hash)
  # alternative names (array)


# puts card_keys.length
# puts subtypes.length
# puts types.length
# puts colors.length
# puts color_identities.length
