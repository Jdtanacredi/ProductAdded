class ContestsController < ApplicationController

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(
      email: params["email"],
      name: params["name"],
    )
  end

end
