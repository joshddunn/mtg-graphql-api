# frozen_string_literal: true

# magic card description information
class CardDescription < ApplicationRecord
  has_many :boosters
end
