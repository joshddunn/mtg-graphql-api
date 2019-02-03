class PrintingAssociation < ApplicationRecord
  belongs_to :card
  belongs_to :magic_set
end
