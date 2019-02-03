Types::BoosterType = GraphQL::ObjectType.define do
  name 'Booster'
  description 'Contains information about a booster pack for a magic set.'

  field :position, types.Int,
        'Returns the slot a card classification can be found ' \
        'in the booster pack.',
        property: :position

  field :cardDescription, Types::CardDescriptionType,
        'Returns descriptive information about a card slot in the ' \
        'booster pack.',
        property: :card_description
end
