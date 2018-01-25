Types::AlternativeNameType = GraphQL::ObjectType.define do
  name "AlternativeName"
  description "Contains information about an alternative name for a magic set."

  # field :id, !types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "Returns an array of magic sets that the alternative name references.", property: :magic_set
  field :identifier, types.String, "Returns the alternative name of a magic set.", property: :identifier

end
