Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  connection :Cards, function: Resolvers::CardSearch
  connection :MagicSets, function: Resolvers::MagicSetSearch
end
