class Product < ActiveRecord::Base
  belongs_to(:Purchase)
  validates(:name, :presence => true)
  validates(:description, :presence => true)
  validates(:cost, :presence => true)
  before_save(:downcase_name)
  before_save(:downcase_description)

  scope(:not_purchased, -> do
    where ({:purchased => false})
  end)

private

  define_method(:downcase_name) do
    self.name=(name().downcase())
  end

  define_method(:downcase_description) do
    self.description=(description().downcase())
  end
end
