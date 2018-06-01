# frozen_string_literal: true

Types::SupertypeType = GraphQL::ObjectType.define do
  name 'Supertype'
  description 'Contains information about magic card supertypes.'

  field :identifier, types.String,
        'Returns the name of the supertype. E.g., Basic, Legendary, etc.',
        property: :identifier
end
