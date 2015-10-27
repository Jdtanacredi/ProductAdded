class AddEmailAddressToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :email_address, :string, limit: 50
  end
end
