class Color < ApplicationRecord
  has_many :color_associations
  has_many :cards, through: :color_associations
end
