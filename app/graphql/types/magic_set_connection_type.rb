Types::MagicSetConnectionType = Types::MagicSetType.define_connection do
  name "MagicSetConnection"
  description "Returns paginated magic set information."

  field :totalCount do
    type types.Int

    resolve ->(obj, args, ctx) {
      obj.nodes.count
    }
  end

end
