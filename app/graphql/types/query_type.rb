Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  connection :Cards, function: Resolvers::CardSearch
  connection :MagicSets, function: Resolvers::MagicSetSearch

  field :CardTypes, types[Types::TypeType] do
    resolve -> (obj, args, ctx) {
      Type.all
    }
  end

  field :Subtypes, types[Types::SubtypeType] do
    resolve -> (obj, args, ctx) {
      Subtype.all
    }
  end

  field :Supertypes, types[Types::SupertypeType] do
    resolve -> (obj, args, ctx) {
      Supertype.all
    }
  end

  field :Colors, types[Types::ColorType] do
    resolve -> (obj, args, ctx) {
      Color.all
    }
  end

  field :ColorIdentities, types[Types::ColorIdentityType] do
    resolve -> (obj, args, ctx) {
      ColorIdentity.all
    }
  end
end
