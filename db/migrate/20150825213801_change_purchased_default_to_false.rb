class ChangePurchasedDefaultToFalse < ActiveRecord::Migration
  def change
    change_column_default(:products, :purchased, false)
  end
end
