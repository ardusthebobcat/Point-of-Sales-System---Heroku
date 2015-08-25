require('pry')

class Purchase < ActiveRecord::Base
  has_many(:products)
  validates(:customer_name, :presence => true)
  # validates_numericality_of(:total, :greater_than => 0)
  before_save(:capitalize_customer_name)
  # after_save(:total_costs)

private

  define_method(:capitalize_customer_name) do
    self.customer_name=(customer_name().split.map {|i| i.capitalize }.join(' '))
  end

  # define_method(:total_costs) do
  #   total=(self.products().each() { |i| sum += i.cost() })
  # end
end
