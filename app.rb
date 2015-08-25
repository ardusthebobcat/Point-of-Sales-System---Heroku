require('pry')
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require("pg")
require('./lib/product')
require('./lib/purchase')
also_reload('lib/**/*.rb')

get('/') do
  @products = Product.all()
  erb(:index)
end

get('/manager') do
  @products = Product.all()
  erb(:manager)
end

post('/products') do
  new_product = Product.create({:name => params.fetch("name"), :description => params.fetch("description"), :cost => params.fetch("cost")})
  redirect('/manager')
end

get('/product/:id') do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product)
end

patch('/product/:id') do
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => params.fetch("name"), :description => params.fetch("description"), :cost => params.fetch("cost")})
  redirect('/manager')
end

delete('/product/:id') do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  redirect('/manager')
end

post('/purchase') do
  @purchase = Purchase.create({:customer_name => params.fetch("customer_name")})
  products = params.fetch("products")
  @sum = 0.0
  products.each() do |product|
    old_product = Product.find(product.to_i)
    @sum = @sum + old_product.cost()
  end
  @purchase.update({:total => @sum})
  # we had to add another loop in order to assign a new purchase_id
  products.each() do |product|
    old_product = Product.find(product.to_i)
    old_product.update({:purchase_id => @purchase.id(), :purchased => true})
  end
  erb(:confirmation)
end
