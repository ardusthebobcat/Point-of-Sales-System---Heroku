class Purchase < ActiveRecord::Base
  has_many(:products)
  validates(:customer_name, :presence => true)
  validates_numericality_of(:total, :greater_than => 0)
  before_save(:capitalize_customer_name)

private

  define_method(:capitalize_customer_name) do
    self.customer_name=(customer_name().split.map {|i| i.capitalize }.join(' '))
  end
end
