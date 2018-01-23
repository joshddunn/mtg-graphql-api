Types::CardDescriptionType = GraphQL::ObjectType.define do
  name "CardDescription"
  description "Card Description Type."

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "The rarity / classification of a card. E.g. Common, Mythic, etc.", property: :identifier

  # field :boosters, types[Types::BoosterType], "", property: :boosters
end
