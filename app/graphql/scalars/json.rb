Scalars::Json = GraphQL::ScalarType.define do
  name 'JSON'
  coerce_result ->(val, _) { JSON.parse(val.to_json) }
end
