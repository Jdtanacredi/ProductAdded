class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(
      total_price_in_cents: params["total_price_in_cents"],
      stripe_token: params["stripe-token"],
      product: Product.find_by_name(params["product-name"]),
      quantity: 1
    )

    @billing_address = BillingAddress.new(
      first_name: params["first-name"],
      last_name: params["last-name"],
      street_line_1: params["street-line-1"],
      street_line_2: params["street-line-2"],
      city: params["city"],
      postal_code: params["postal-code"],
      region: params["region"],
      country: params["country"],
      vat_number: params["vat-number"],
      email_address: params["email-address"],
      phone_number: params["phone-number"],
      purchase: @purchase
    )

    if @purchase.save
      @billing_address.save

      begin
        if params["shipping-same"] == "shipping-true"
          @shipping_address = ShippingAddress.new(
            first_name: params["first-name"],
            last_name: params["last-name"],
            street_line_1: params["street-line-1"],
            street_line_2: params["street-line-2"],
            city: params["city"],
            postal_code: params["postal-code"],
            region: params["region"],
            country: params["country"],
            vat_number: params["vat-number"],
            email_address: params["email-address"],
            phone_number: params["phone-number"],
            purchase: @purchase
          )
        elsif params["shipping-same"] == "shipping-false"
          @shipping_address = ShippingAddress.new(
            first_name: params["first-name"],
            last_name: params["last-name"],
            street_line_1: params["shipping-street-line-1"],
            street_line_2: params["shipping-street-line-2"],
            city: params["shipping-city"],
            postal_code: params["shipping-postal-code"],
            region: params["shipping-region"],
            country: params["shipping-country"],
            email_address: params["email-address"],
            phone_number: params["phone-number"],
            purchase: @purchase
          )
        end
        @shipping_address.save!
      rescue
        @purchase.set_shipping_address_same_as_billing
      end

      redirect_to '/success'
    else
      render json: 'An error has occurred. Please go back and try again.'
    end
  end

end
