class Purchase < ActiveRecord::Base
  has_many(:products)
  validates(:customer_name, :presence => true)
  validates_numericality_of(:total, :greater_than => 0)
end
