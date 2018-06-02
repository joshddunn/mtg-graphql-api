# frozen_string_literal: true

# magic set block information
class Block < ApplicationRecord
  has_many :magic_sets
end
