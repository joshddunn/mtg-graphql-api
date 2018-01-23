Types::SubtypeType = GraphQL::ObjectType.define do
  name "Subtype"
  description ""

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "Name of card subtype. E.g., Merfolk, Wizard, etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
