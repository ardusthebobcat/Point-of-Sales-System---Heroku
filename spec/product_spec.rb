require('spec_helper')

describe(Product) do
  it("validates presence of name") do
    product = Product.new({:name => ""})
    expect(product.save()).to(eq(false))
  end

  it("validates presence of description") do
    product = Product.new({:description => ""})
    expect(product.save()).to(eq(false))
  end

  it("validates presence of cost") do
    product = Product.new({:cost => nil})
    expect(product.save()).to(eq(false))
  end

  it("converts the name to lowercase") do
    product = Product.create({:name => "Gum", :description => "A pack of Bubblicious gum", :cost => 1.55})
    expect(product.name()).to(eq("gum"))
  end

  it("converts the description to lowercase") do
    product = Product.create({:name => "Gum", :description => "A pack of Bubblicious gum", :cost => 1.55})
    expect(product.description()).to(eq("a pack of bubblicious gum"))
  end

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
