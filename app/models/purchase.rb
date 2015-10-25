class Purchase < ActiveRecord::Base

  validates_presence_of :total_price_in_cents, :stripe_token

  def process_payment
    begin
      charge = Stripe::Charge.create(
        # if you do the stripe/quaderno thing, i think amount is supposed to be the total amount, including taxes.
        # then quaderno splits it out for you?
        :amount => self.total_price_in_cents,
        :currency => 'usd',
        :source => self.stripe_token,
        :description => "Gold001",
        :capture => true,
        :metadata => {
          :tax_name => 'VAT',
          :tax_rate => 20,
          :ip_address => request.ip
        }
      )
    rescue Stripe::CardError => e
      "Your card has been declined."
    end
  end

end
