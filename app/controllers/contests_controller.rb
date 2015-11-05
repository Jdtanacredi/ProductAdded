class ContestsController < ApplicationController

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    status = @contest.save ? :ok : 422
    render json: @contest.to_json(methods: [:errors]), layout: false, status: status

  end

private

  def contest_params
    params.require(:contest).permit(:email, :first_name, :last_name)
  end

end
