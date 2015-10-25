class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(
      total_price_in_cents: params[:total_price_in_cents],
      stripe_token: params[:stripe_token],
      product: params[:product],
      quantity: 1,
      billing_address: {
        first_name: params[:first_name],
        last_name: params[:last_name],
        street_line_1: params[:street_line_1],
        street_line_2: params[:street_line_2],
        city: params[:city],
        postal_code: params[:postal_code],
        region: params[:region],
        country: params[:country],
        vat_number: params[:vat_number],
        coupon: params[:coupon]
      },
      shipping_address: {
        first_name: params[:first_name],
        last_name: params[:last_name],
        street_line_1: params[:street_line_1],
        street_line_2: params[:street_line_2],
        city: params[:city],
        postal_code: params[:postal_code],
        region: params[:region],
        country: params[:country],
        vat_number: params[:vat_number],
        coupon: params[:coupon]
      }
    )

    if @purchase.save
      @purchase.process_payment

      # success redirect
    else
      # fail redirect
    end
  end

end
