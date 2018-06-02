# frozen_string_literal: true

# magic set alternative names
class AlternativeName < ApplicationRecord
  belongs_to :magic_set
end
