# frozen_string_literal: true

# magic card subtype association
class SubtypeAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :subtype
end
