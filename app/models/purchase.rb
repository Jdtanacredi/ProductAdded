class Purchase < ActiveRecord::Base
  belongs_to :product

  after_create :decrease_product_quantity

  def decrease_product_quantity
    existing_quantity = self.product.quantity
    new_quantity = existing_quantity - 1
    self.product.quantity = new_quantity
    self.product.save!
  end

end
