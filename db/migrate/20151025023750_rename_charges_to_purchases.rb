class RenameChargesToPurchases < ActiveRecord::Migration
  def change
    rename_table :charges, :purchases
  end
end
