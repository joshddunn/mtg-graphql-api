# frozen_string_literal: true

# magic card supertype information
class Supertype < ApplicationRecord
  has_many :supertype_associations
  has_many :cards, through: :supertype_associations
end
