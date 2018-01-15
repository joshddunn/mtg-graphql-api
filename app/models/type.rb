class Type < ApplicationRecord
  has_many :type_associations
  has_many :cards, through: :type_associations
end
