class Quarter < ApplicationRecord
  validates :quarter_num, presence: true
  validates_numericality_of :quarter_num, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4
  validates :year, presence: true
  validates_numericality_of :year, only_integer: true

  def quarter_title
    "#{year} Q#{quarter_num}"
  end
end
