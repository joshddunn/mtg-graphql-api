# frozen_string_literal: true

Types::SubtypeType = GraphQL::ObjectType.define do
  name 'Subtype'
  description 'Contains information about magic card subtypes.'

  field :identifier, types.String,
        'Returns the name of the subtype. E.g., Merfolk, Wizard, etc.',
        property: :identifier
end
