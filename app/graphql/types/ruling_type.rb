Types::RulingType = GraphQL::ObjectType.define do
  name 'Ruling'
  description 'Contains information about magic card rulings.'

  field :date, types.String,
        'Returns the date of the ruling.',
        property: :date

  field :text, types.String,
        'Returns the explanation of the ruling.',
        property: :text
end
