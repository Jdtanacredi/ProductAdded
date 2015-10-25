class AddQuantityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :quantity, :integer, limit: 2, default: 500
  end
end
