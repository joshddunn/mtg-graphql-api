class Token < ApplicationRecord
  belongs_to :artist
  belongs_to :magic_set

  has_many :token_color_identity_associations
  has_many :color_identities, through: :token_color_identity_associations, source: :color

  has_many :token_color_indicator_associations
  has_many :color_indicators, through: :token_color_indicator_associations, source: :color

  has_many :token_color_associations
  has_many :colors, through: :token_color_associations, source: :color
end
