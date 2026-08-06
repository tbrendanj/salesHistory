class Sale < ApplicationRecord
  belongs_to :Product
  belongs_to :Quarter
  validates :quantity, presence: true
  validates_numericality_of :quantity, only_integer: true, greater_than_or_equal_to: 0
end
