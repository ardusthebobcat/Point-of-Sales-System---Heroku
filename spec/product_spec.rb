require('spec_helper')

describe(Product) do
  describe(".not_purchased") do
    it("returns whether or not the product is marked as 'purchased'") do
      not_purchased_product1 = Product.create({:name => "Bicycle", :description => "A blue bike", :cost => 40.15, :purchased => false})
      not_purchased_product2 = Product.create({:name => "Batman Comic", :description => "An issue of New 52 Batman #1", :cost => 12.95, :purchased => false})
      not_purchased_products = [not_purchased_product1, not_purchased_product2]
      purchased_product = Product.create({:name => "Gum", :description => "A pack of Bubblicious gum", :cost => 1.55, :purchased => true})
      expect(Product.not_purchased()).to(eq(not_purchased_products))
    end
  end
end
