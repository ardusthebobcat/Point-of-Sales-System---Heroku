require('spec_helper')

describe(Purchase) do
  describe("#products") do
    it("tells which products are in it") do
      test_purchase = Purchase.create({:customer_name => "Jen Bell", :total => 1.55})
      purchased_product = Product.create({:name => "Gum", :description => "A pack of Bubblicious gum", :cost => 1.55, :purchased => true, :purchase_id => test_purchase.id()})
      expect(test_purchase.products()).to(eq([purchased_product]))
    end
  end
end
