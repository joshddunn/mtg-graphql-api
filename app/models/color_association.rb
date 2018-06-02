# frozen_string_literal: true

# magic color association information
class ColorAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :color
end
