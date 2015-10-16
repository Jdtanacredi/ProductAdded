class ProductsController < ApplicationController
  require 'jwt'

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    @chargeJSON = JWT.encode({
      iat: Time.now.to_i,
      amount: 40000,
      currency: 'USD'
    }, ENV['QUAD_TEST_SECRET'])
  end
end
