Types::CardDescriptionType = GraphQL::ObjectType.define do
  name "CardDescription"
  description ""

  # field :id, types.ID, "", property: :id
  field :identifier, types.String, "", property: :identifier

  # field :boosters, types[Types::BoosterType], "", property: :boosters
end
