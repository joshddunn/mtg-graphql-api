class Color < ApplicationRecord
  has_many :color_associations
  has_many :cards, through: :color_associations

  has_many :color_identity_associations
  has_many :cards, through: :color_identity_associations

  has_many :color_indicator_associations
  has_many :cards, through: :color_indicator_associations

  has_many :token_color_associations
  has_many :tokens, through: :token_color_associations

  has_many :token_color_identity_associations
  has_many :tokens, through: :token_color_identity_associations

  has_many :token_color_indicator_associations
  has_many :tokens, through: :token_color_indicator_associations
end
