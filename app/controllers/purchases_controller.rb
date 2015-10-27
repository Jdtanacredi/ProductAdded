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
      purchase: @purchase
    )

    @shipping_address = ShippingAddress.new(
      email_address: params["email-address"],
      first_name: params["first-name"],
      last_name: params["last-name"],
      street_line_1: params["street-line-1"],
      street_line_2: params["street-line-2"],
      city: params["city"],
      postal_code: params["postal-code"],
      region: params["region"],
      country: params["country"],
      purchase: @purchase
    )

    if @purchase.save
      @billing_address.save
      @shipping_address.save

      render json: "success!"
    else
      render json: "fail!"
    end
  end

end
