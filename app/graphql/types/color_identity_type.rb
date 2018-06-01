# frozen_string_literal: true

Types::ColorIdentityType = GraphQL::ObjectType.define do
  name 'ColorIdentity'
  description 'Contains information about magic card color identities.'

  field :identifier, types.String,
        'Returns the letter representing a color identity. This field ' \
        'returns either U, B, R, G, or W.',
        property: :identifier
end
