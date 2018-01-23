Types::AlternativeNameType = GraphQL::ObjectType.define do
  name "AlternativeName"
  description "Alternative name for a magic set."

  # field :id, !types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "Returns a list of magic sets that the alternative name belongs to.", property: :magic_set
  field :identifier, types.String, "The alternative name", property: :identifier

end
