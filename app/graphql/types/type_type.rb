# frozen_string_literal: true

Types::TypeType = GraphQL::ObjectType.define do
  name 'Type'
  description 'Contains information about the type of a magic card.'

  field :identifier, types.String,
        'Returns the name of the card type. E.g., ' \
        'Instant, Land, Enchantment etc.',
        property: :identifier
end
