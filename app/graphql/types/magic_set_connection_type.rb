Types::MagicSetConnectionType = Types::MagicSetType.define_connection do
  name 'MagicSetConnection'
  description 'Returns paginated information about magic the gathering sets.'

  field :totalCount do
    description 'Returns the total number of nodes found by the query.'

    type types.Int

    resolve ->(obj, _args, _ctx) {
      obj.nodes.length
    }
  end
end
