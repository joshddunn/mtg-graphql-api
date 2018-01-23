Types::TypeType = GraphQL::ObjectType.define do
  name "Type"
  description ""

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "Name of card type. E.g., Instant, Land, Enchantment etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
