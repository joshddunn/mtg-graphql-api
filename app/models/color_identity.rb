class ColorIdentity < ApplicationRecord
  has_many :color_identity_associations
  has_many :cards, through: :color_identity_associations
end
