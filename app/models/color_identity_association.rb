# frozen_string_literal: true

# magic color identity association information
class ColorIdentityAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :color_identity
end
