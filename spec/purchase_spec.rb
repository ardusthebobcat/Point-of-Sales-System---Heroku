require('spec_helper')
require('pry')

describe(Purchase) do
  it("validates presence of customer name") do
    purchase = Purchase.new({:customer_name => ""})
    expect(purchase.save()).to(eq(false))
  end

  it("validates that the total is a positive number") do
    purchase = Purchase.new({:total => -1.5})
    expect(purchase.save()).to(eq(false))
  end

  it("capitalizes the customer name") do
    purchase = Purchase.create({:customer_name => "jen bell", :total => 1.55})
    expect(purchase.customer_name()).to(eq("Jen Bell"))
  end

  # it("totals the costs of the products") do
  #   purchase = Purchase.create({:customer_name => "jen bell"})
  #   product1 = Product.create({:name => "Gum", :description => "A pack of Bubblicious gum", :cost => 1.55, :purchase_id => purchase.id()})
  #   product2 = Product.create({:name => "mattress", :description => "a really nice mattress", :cost => 1867.39, :purchase_id => purchase.id()})
  #   expect(purchase.total()).to(eq(1868.94))
  # end

  describe("#products") do
    it("tells which products are in it") do
      test_purchase = Purchase.create({:customer_name => "Jen Bell", :total => 1.55})
      purchased_product = Product.create({:name => "Gum", :description => "A pack of Bubblicious gum", :cost => 1.55, :purchased => true, :purchase_id => test_purchase.id()})
      expect(test_purchase.products()).to(eq([purchased_product]))
    end
  end
end
