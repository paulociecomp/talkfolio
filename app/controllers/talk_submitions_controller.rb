class TalkSubmitionsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @talks = Talk.all
  end

  def create
    @group = Group.find(params[:group_id])
    talk = Talk.find(params[:talk][:id])

    @group.submit_talk(talk)
    
    flash[:notice] = t(:you_submited_a_talk_to_this_group)
    redirect_to @group
  end
end