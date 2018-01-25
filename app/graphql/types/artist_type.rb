Types::ArtistType = GraphQL::ObjectType.define do
  name "Artist"
  description "Contains information about an artist that illustrated a magic card."

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "Returns the name of an artist.", property: :identifier

  connection :cards, Types::CardConnectionType, "Returns an array of cards that the artist has illustrated.", property: :cards
end
