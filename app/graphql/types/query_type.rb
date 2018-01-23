Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  connection :Cards, function: Resolvers::CardSearch
  connection :MagicSets, function: Resolvers::MagicSetSearch, max_page_size: 3

  field :CardTypes, types[Types::TypeType] do
    description "Card type information."
    resolve -> (obj, args, ctx) {
      Type.all
    }
  end

  field :Subtypes, types[Types::SubtypeType] do
    description "Card subtype information."
    resolve -> (obj, args, ctx) {
      Subtype.all
    }
  end

  field :Supertypes, types[Types::SupertypeType] do
    description "Card supertype information."
    resolve -> (obj, args, ctx) {
      Supertype.all
    }
  end

  field :Colors, types[Types::ColorType] do
    description "Color information."
    resolve -> (obj, args, ctx) {
      Color.all
    }
  end

  field :ColorIdentities, types[Types::ColorIdentityType] do
    description "Color identity information."
    resolve -> (obj, args, ctx) {
      ColorIdentity.all
    }
  end
end
