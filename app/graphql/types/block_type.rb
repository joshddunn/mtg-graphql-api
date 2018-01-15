Types::BlockType = GraphQL::ObjectType.define do
  name "Block"
  description ""

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "", property: :identifier

  field :magicSets, types[Types::MagicSetType], "", property: :magic_sets
end
