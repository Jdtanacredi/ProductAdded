class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_line_1
      t.string :street_line_2
      t.string :city
      t.string :postal_code
      t.string :region
      t.string :country
      t.string :vat_number

      t.string :type
      t.references :purchases

      t.timestamps
    end
  end
end
