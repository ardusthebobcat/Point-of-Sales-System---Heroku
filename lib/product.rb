class Product < ActiveRecord::Base
  belongs_to(:Purchase)
  validates(:name, :presence => true)
  validates(:description, :presence => true)
  validates(:cost, :presence => true)

  scope(:not_purchased, -> do
    where ({:purchased => false})
  end)
end
