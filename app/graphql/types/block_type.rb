Types::BlockType = GraphQL::ObjectType.define do
  name "Block"
  description "Block Information."

  # field :id, !types.ID, "", property: :id
  field :identifier, types.String, "The name of the block. E.g., Zendikar, Mirrodin, etc.", property: :identifier

  field :magicSets, types[Types::MagicSetType], "Returns a list of sets that are in this block. E.g., If the block is Zendikar, the sets Zendikar, Worldwake, and Rise of the Eldrazi will be returned.", property: :magic_sets
end
