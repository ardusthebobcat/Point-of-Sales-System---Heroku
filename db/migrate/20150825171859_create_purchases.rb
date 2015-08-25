class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:customer_name, :string)
      t.column(:total, :float)

      t.timestamps()
    end

    add_column(:products, :purchase_id, :integer)
  end
end
