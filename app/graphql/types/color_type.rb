Types::ColorType = GraphQL::ObjectType.define do
  name "Color"
  description "Returns information about magic card colors."

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "Returns the full name of magic card colors. This field returns Blue, Black, White, Green, or Red.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
