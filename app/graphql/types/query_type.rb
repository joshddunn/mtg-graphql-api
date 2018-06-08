Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  connection :Cards, function: Resolvers::CardSearch
  connection :MagicSets, function: Resolvers::MagicSetSearch, max_page_size: 3

  field :CardTypes, types[Types::TypeType] do
    description "Returns structured information about magic card types."
    resolve -> (obj, args, ctx) {
      Type.all
    }
  end

  field :Subtypes, types[Types::SubtypeType] do
    description "Returns structured information about magic card subtypes."
    resolve -> (obj, args, ctx) {
      Subtype.all
    }
  end

  field :Supertypes, types[Types::SupertypeType] do
    description "Returns structured information about magic card supertypes."
    resolve -> (obj, args, ctx) {
      Supertype.all
    }
  end

  field :Colors, types[Types::ColorType] do
    description "Returns structured information about magic card colors."
    resolve -> (obj, args, ctx) {
      Color.all
    }
  end

  field :ColorIdentities, types[Types::ColorIdentityType] do
    description "Returns structured information about magic card color identities."
    resolve -> (obj, args, ctx) {
      ColorIdentity.all
    }
  end
end
