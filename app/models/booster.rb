# frozen_string_literal: true

# magic set booster pack information
class Booster < ApplicationRecord
  belongs_to :magic_set
  belongs_to :card_description
end
