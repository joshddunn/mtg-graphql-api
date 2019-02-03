Types::ColorType = GraphQL::ObjectType.define do
  name 'Color'
  description 'Returns information about magic card colors.'

  field :identifier, types.String,
        'Returns the full name of magic card colors. This field returns ' \
        'Blue, Black, White, Green, or Red.',
        property: :identifier
end
