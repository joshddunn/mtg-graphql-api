Types::ArtistType = GraphQL::ObjectType.define do
  name "Artist"
  description "Artist Information."

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "Artist name", property: :identifier

  connection :cards, Types::CardConnectionType, "Returns a list of cards that the artist has illustrated.", property: :cards
end
