class FixTypoOnAddresses < ActiveRecord::Migration
  def change
    drop_table :addresses

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
      t.belongs_to :purchase

      t.timestamps
    end
  end
end
