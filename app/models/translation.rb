# frozen_string_literal: true

# magic card translation information
class Translation < ApplicationRecord
  belongs_to :magic_set
end
