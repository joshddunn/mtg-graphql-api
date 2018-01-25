Types::MagicRaritiesCodeType = GraphQL::ObjectType.define do
  name "MagicRaritiesCode"
  description "Contains information about the magic rarity code for a magic set. Only appears in older magic sets."

  # field :id, types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "Returns information about the magic set that has the rarity code.", property: :magic_set
  field :identifier, types.String, "Returns the string represeting the magic rarity code.", property: :identifier

end
