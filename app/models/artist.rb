# frozen_string_literal: true

# magic card artist information
class Artist < ApplicationRecord
  has_many :cards
end
