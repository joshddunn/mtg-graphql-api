Scalars::Json = GraphQL::ScalarType.define do
  name "JSON"
  coerce_result -> (val, ctx) { JSON.parse(val.to_json) }
end
