class ContestsController < ApplicationController

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(
      email: params["email"],
      name: params["name"],
    )

    if @purchase.save
      redirect_to '/contest-success'
    else
      render json: 'An error has occurred. Please go back and try again.'
    end

  end

end
