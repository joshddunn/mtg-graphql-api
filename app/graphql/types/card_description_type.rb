Types::CardDescriptionType = GraphQL::ObjectType.define do
  name "CardDescription"
  description "Contains information about card slots in a booster pack."

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "Returns the rarity or classification of a card slot in a booster pack. E.g. Common, Mythic, etc.", property: :identifier

  # field :boosters, types[Types::BoosterType], "", property: :boosters
end
