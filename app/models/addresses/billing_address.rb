class BillingAddress < Address
  belongs_to :purchase

  validates_presence_of :first_name,
                        :last_name,
                        :street_line_1,
                        :city,
                        :postal_code,
                        :country,
                        :email_address,
                        :phone_number

end
