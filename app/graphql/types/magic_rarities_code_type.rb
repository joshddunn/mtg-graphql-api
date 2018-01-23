Types::MagicRaritiesCodeType = GraphQL::ObjectType.define do
  name "MagicRaritiesCode"
  description "Magic rarity code information. Only appears in older magic sets."

  # field :id, types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "", property: :magic_set
  field :identifier, types.String, "Magic rarities code.", property: :identifier

end
