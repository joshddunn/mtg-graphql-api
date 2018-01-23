Types::MagicSetConnectionType = Types::MagicSetType.define_connection do
  name "MagicSetConnection"
  description "Returns paginated magic set information."

  field :totalCount do
    description "Total number of nodes in the query."

    type types.Int

    resolve ->(obj, args, ctx) {
      obj.nodes.count
    }
  end

end
