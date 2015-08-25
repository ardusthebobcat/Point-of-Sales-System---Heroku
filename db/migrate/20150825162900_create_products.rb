class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:description, :string)
      t.column(:cost, :float)
      t.column(:purchased, :boolean)

      t.timestamps()
    end
  end
end
