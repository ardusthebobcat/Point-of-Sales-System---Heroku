class Product < ActiveRecord::Base
  belongs_to(:Purchase)
  
  scope(:not_purchased, -> do
    where ({:purchased => false})
  end)
end
