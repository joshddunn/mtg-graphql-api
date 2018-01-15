Types::BoosterType = GraphQL::ObjectType.define do
  name "Booster"
  description ""

  # field :id, !types.ID, "", property: :id
  # field :magicSet, Types::MagicSetType, "", property: :magic_set
  field :position, types.Int, "", property: :position
  field :cardDescription, Types::CardDescriptionType, "", property: :card_description

end
