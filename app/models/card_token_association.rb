class CardTokenAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :token
end
