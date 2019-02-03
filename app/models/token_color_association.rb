class TokenColorAssociation < ApplicationRecord
  belongs_to :token
  belongs_to :color
end
