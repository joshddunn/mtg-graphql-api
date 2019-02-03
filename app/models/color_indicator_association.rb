class ColorIndicatorAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :color
end
