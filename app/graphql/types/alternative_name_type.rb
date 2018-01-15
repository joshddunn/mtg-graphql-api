Types::AlternativeNameType = GraphQL::ObjectType.define do
  name "AlternativeName"
  description ""

  # field :id, !types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "", property: :magic_set
  field :identifier, types.String, "", property: :identifier

end
