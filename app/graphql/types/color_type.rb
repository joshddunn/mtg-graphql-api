Types::ColorType = GraphQL::ObjectType.define do
  name "Color"
  description "Card color information."

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "Name of card colors. E.g., Blue, Black, White, etc.", property: :identifier

  # field :cards, types[Types::CardType], "", property: :cards
end
