Types::BoosterType = GraphQL::ObjectType.define do
  name "Booster"
  description "Booster Information."

  # field :id, !types.ID, "", property: :id
  # field :magicSet, Types::MagicSetType, "", property: :magic_set
  field :position, types.Int, "The position the card can be found in the pack.", property: :position
  field :cardDescription, Types::CardDescriptionType, "Describes the card rarity / classification.", property: :card_description

end
