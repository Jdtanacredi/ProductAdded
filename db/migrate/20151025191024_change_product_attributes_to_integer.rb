class ChangeProductAttributesToInteger < ActiveRecord::Migration
  def change
    change_column :products, :price, :integer, limit: 2
    change_column :products, :amount, :integer, limit: 2
  end
end
