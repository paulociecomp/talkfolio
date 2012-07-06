class TalksController < ApplicationController
  before_filter :authenticate_user!

  def my_talks
    @talks = current_user.talks
  end

  def new
  end

  def create
    @talk = Talk.new(params[:talk])

    if @talk.add_to_user_portfolio(current_user)
      flash[:notice] = "You added a new talk to your portfolio!"
      redirect_to my_talks_path
    end
  end
end