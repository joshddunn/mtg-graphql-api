Types::TranslationType = GraphQL::ObjectType.define do
  name "Translation"
  description ""

  # field :id, types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "", property: :magic_set
  field :code, types.String, "", property: :code
  field :identifier, types.String, "", property: :identifier

end
