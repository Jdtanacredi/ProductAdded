class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :product, index: true
      t.string :stripe_token
      t.integer :quantity
      t.integer :total_price_in_cents

      t.timestamps
    end
  end
end
