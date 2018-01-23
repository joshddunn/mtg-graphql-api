Types::MagicSetType = GraphQL::ObjectType.define do
  name "MagicSet"
  description ""

  # field :id, types.ID, "", property: :id
  field :name, types.String, "", property: :name
  field :code, types.String, "", property: :code
  field :releaseDate, types.String, "", property: :release_date
  field :border, types.String, "Border type of cards in the set. Returns either nil, silver, black, or white.", property: :border
  field :setType, types.String, "Returns the type of the set. E.g., starter, commander, core, etc.", property: :set_type
  field :mkmName, types.String, "", property: :mkm_name
  field :mkm_id, types.Int, "", property: :mkm_id
  field :magicCardsInfoCode, types.String, "", property: :magic_cards_info_code
  field :gathererCode, types.String, "", property: :gatherer_code
  field :oldCode, types.String, "", property: :old_code
  field :onlineOnly, types.Boolean, "", property: :online_only
  field :block, Types::BlockType, "A magic set's block information.", property: :block

  field :alternativeNames, types[Types::AlternativeNameType], "Returns a list of alternative names for the magic set.", property: :alternative_names
  field :boosters, types[Types::BoosterType], "Booster information.", property: :boosters
  field :magicRaritiesCodes, types[Types::MagicRaritiesCodeType], "Returns a list of magic rarities codes.", property: :magic_rarities_codes
  field :translations, types[Types::TranslationType], "Returns a list of translations for the name of a magic set.", property: :translations

  connection :cards, Types::CardConnectionType, "Returns paginated card information.", property: :cards
end
