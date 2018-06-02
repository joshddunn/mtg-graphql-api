# frozen_string_literal: true

# magic card variation information
class Variation < ApplicationRecord
  belongs_to :card
  belongs_to :variation, class_name: 'Card'
end
