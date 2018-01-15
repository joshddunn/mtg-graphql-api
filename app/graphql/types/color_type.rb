Types::ColorType = GraphQL::ObjectType.define do
  name "Color"
  description ""

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
