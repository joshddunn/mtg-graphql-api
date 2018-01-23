Types::ColorIdentityType = GraphQL::ObjectType.define do
  name "ColorIdentity"
  description ""

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "Name of card color identities. E.g., U, B, etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
