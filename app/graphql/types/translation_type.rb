Types::TranslationType = GraphQL::ObjectType.define do
  name "Translation"
  description "Contains information about the translated name of a magic set."

  # field :id, types.ID, "", property: :id
  field :magicSet, Types::MagicSetType, "Returns information about the associated magic set.", property: :magic_set
  field :code, types.String, "Returns the language code of the translation.", property: :code
  field :identifier, types.String, "Returns the translated name of a magic set.", property: :identifier

end
