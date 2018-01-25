Types::SubtypeType = GraphQL::ObjectType.define do
  name "Subtype"
  description "Contains information about magic card subtypes."

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "Returns the name of the subtype. E.g., Merfolk, Wizard, etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
