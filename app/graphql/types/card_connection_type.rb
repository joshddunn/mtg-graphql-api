Types::CardConnectionType = Types::CardType.define_connection do
  name "CardConnection"
  description "Card information."

  field :totalCount do
    type types.Int

    resolve ->(obj, args, ctx) {
      obj.nodes.count
    }
  end
end
