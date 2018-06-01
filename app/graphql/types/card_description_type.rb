# frozen_string_literal: true

Types::CardDescriptionType = GraphQL::ObjectType.define do
  name 'CardDescription'
  description 'Contains information about card slots in a booster pack.'

  field :identifier, types.String,
        'Returns the rarity or classification of a card slot in a booster ' \
        'pack. E.g. Common, Mythic, etc.',
        property: :identifier
end
