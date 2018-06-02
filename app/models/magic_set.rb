# frozen_string_literal: true

# magic set information
class MagicSet < ApplicationRecord
  belongs_to :block, optional: true

  has_many :alternative_names
  has_many :boosters
  has_many :cards
  has_many :magic_rarities_codes
  has_many :translations
end
