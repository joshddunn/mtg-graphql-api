class TokenColorIndicatorAssociation < ApplicationRecord
  belongs_to :token
  belongs_to :color
end
