Types::ArtistType = GraphQL::ObjectType.define do
  name "Artist"
  description ""

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "", property: :identifier

  connection :cards, Types::CardConnectionType, "", property: :cards
end
