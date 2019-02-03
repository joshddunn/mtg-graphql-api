class MagicSet < ApplicationRecord
  belongs_to :block, optional: true

  has_many :boosters
  has_many :cards
  has_many :tokens
end
