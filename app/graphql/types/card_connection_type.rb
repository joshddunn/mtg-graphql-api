Types::CardConnectionType = Types::CardType.define_connection do
  name "CardConnection"
  description "Returns paginated card information."

  field :totalCount do
    type types.Int

    resolve ->(obj, args, ctx) {
      obj.nodes.count
    }
  end
end
