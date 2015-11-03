class ContestsController < ApplicationController

  def new
    @contest = Contest.new
  end

  def create
    binding.pry
    @contest = Contest.new(
      email: params["contest"]["email"],
      first_name: params["contest"]["first_name"],
      last_name: params["contest"]["last_name"]
    )
    binding.pry
    if @contest.save
      redirect_to '/contest-success'
    else
      render json: 'An error has occurred. Please go back and try again.'
    end

  end

end
