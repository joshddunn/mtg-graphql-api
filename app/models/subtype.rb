# frozen_string_literal: true

# magic card subtype information
class Subtype < ApplicationRecord
  has_many :subtype_associations
  has_many :cards, through: :subtype_associations
end
