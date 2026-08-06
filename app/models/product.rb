class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0

  def product_name_with_id
    "#{id}. #{name}"
  end
end
