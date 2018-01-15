class Variation < ApplicationRecord
  belongs_to :card
  belongs_to :variation, class_name: "Card"
end
