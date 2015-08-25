class Product < ActiveRecord::Base
  scope(:not_purchased, -> do
    where ({:purchased => false})
  end)
end
