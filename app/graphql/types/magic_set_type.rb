Types::MagicSetType = GraphQL::ObjectType.define do
  name "MagicSet"
  description ""

  # field :id, types.ID, "", property: :id
  field :name, types.String, "", property: :name
  field :code, types.String, "", property: :code
  field :releaseDate, types.String, "", property: :release_date
  field :border, types.String, "", property: :border
  field :setType, types.String, "", property: :set_type
  field :mkmName, types.String, "", property: :mkm_name
  field :mkm, types.Int, "", property: :mkm_id
  field :magicCardsInfoCode, types.String, "", property: :magic_cards_info_code
  field :gathererCode, types.String, "", property: :gatherer_code
  field :oldCode, types.String, "", property: :old_code
  field :onlineOnly, types.Boolean, "", property: :online_only
  field :block, Types::BlockType, "", property: :block

  field :alternativeNames, types[Types::AlternativeNameType], "", property: :alternative_names
  field :boosters, types[Types::BoosterType], "", property: :boosters
  field :cards, types[Types::CardType], "", property: :cards
  field :magicRaritiesCodes, types[Types::MagicRaritiesCodeType], "", property: :magic_rarities_codes
  field :translations, types[Types::TranslationType], "", property: :translations
end
