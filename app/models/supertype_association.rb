# frozen_string_literal: true

# magic card supertype association
class SupertypeAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :supertype
end
