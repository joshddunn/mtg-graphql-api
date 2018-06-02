# frozen_string_literal: true

# magic card type association
class TypeAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :type
end
