Types::CardConnectionType = Types::CardType.define_connection do
  name "CardConnection"
  description "Returns paginated card information."

  field :totalCount do
    description "Total number of nodes in the query."

    type types.Int

    resolve ->(obj, args, ctx) {
      obj.nodes.count
    }
  end
end
