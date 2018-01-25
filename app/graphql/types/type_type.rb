Types::TypeType = GraphQL::ObjectType.define do
  name "Type"
  description "Contains information about the type of a magic card."

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "Returns the name of the card type. E.g., Instant, Land, Enchantment etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
