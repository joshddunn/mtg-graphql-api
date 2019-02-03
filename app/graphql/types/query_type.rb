Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  connection :Cards, function: Resolvers::CardSearch
  connection :MagicSets, function: Resolvers::MagicSetSearch, max_page_size: 3

  field :CardTypes, types[Types::TypeType] do
    description 'Returns structured information about magic card types.'
    resolve ->(_, _, _) {
      Type.all
    }
  end

  field :Subtypes, types[Types::SubtypeType] do
    description 'Returns structured information about magic card subtypes.'
    resolve ->(_, _, _) {
      Subtype.all
    }
  end

  field :Supertypes, types[Types::SupertypeType] do
    description 'Returns structured information about magic card supertypes.'
    resolve ->(_, _, _) {
      Supertype.all
    }
  end

  field :Colors, types[Types::ColorType] do
    description 'Returns structured information about magic card colors.'
    resolve ->(_, _, _) {
      Color.all
    }
  end

  field :ColorIdentities, types[Types::ColorIdentityType] do
    description 'Returns structured information about magic card color identities.'
    resolve ->(_, _, _) {
      ColorIdentity.all
    }
  end
end
