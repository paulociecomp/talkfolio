class TalksController < ApplicationController
  def my_talks
  end

  def new
  end

  def create
    @talk = Talk.new(params[:talk])

    if @talk.add_to_portfolio
      flash[:notice] = "You added a new talk to your portfolio!"
      redirect_to my_talks_path
    end
  end
end