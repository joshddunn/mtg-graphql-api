Types::SupertypeType = GraphQL::ObjectType.define do
  name "Supertype"
  description ""

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "Name of card supertype. E.g., Basic, Legendary, etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
