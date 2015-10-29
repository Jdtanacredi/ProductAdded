class Purchase < ActiveRecord::Base
  has_many :billing_addresses
  has_many :shipping_addresses
  belongs_to :product

  validates_presence_of :product, :stripe_token

  after_create :decrease_product_quantity

  def decrease_product_quantity
    existing_quantity = self.product.quantity
    new_quantity = existing_quantity - 1
    self.product.quantity = new_quantity
    self.product.save!
  end

  def set_shipping_address_same_as_billing
    shipping_address = ShippingAddress.new(
      first_name: self.billing_addresses.first.first_name,
      last_name: self.billing_addresses.first.last_name,
      street_line_1: self.billing_addresses.first.street_line_1,
      street_line_2: self.billing_addresses.first.street_line_2,
      city: self.billing_addresses.first.city,
      postal_code: self.billing_addresses.first.postal_code,
      region: self.billing_addresses.first.region,
      country: self.billing_addresses.first.country,
      vat_number: self.billing_addresses.first.vat_number,
      email_address: self.billing_addresses.first.email_address,
      phone_number: self.billing_addresses.first.phone_number,
      purchase: self
    )
    shipping_address.save!
  end

end
