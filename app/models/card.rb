class Card < ApplicationRecord
  belongs_to :artist
  belongs_to :magic_set

  has_many :color_identity_associations
  has_many :color_identities, through: :color_identity_associations, source: :color

  has_many :color_indicator_associations
  has_many :color_indicators, through: :color_indicator_associations, source: :color

  has_many :color_associations
  has_many :colors, through: :color_associations

  has_many :subtype_associations
  has_many :subtypes, through: :subtype_associations

  has_many :supertype_associations
  has_many :supertypes, through: :supertype_associations

  has_many :type_associations
  has_many :types, through: :type_associations

  has_many :variations
  has_many :variants, through: :variations, source: :card

  has_many :printing_associations
  has_many :printings, through: :printing_associations, source: :magic_set

  has_many :rulings
  has_many :foreign_data
end
