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

  def edit
    @group = Group.find(params[:group_id])
    @pending_talks = @group.pending_talks
  end

  def accept
    group = Group.find(params[:group_id])

    params[:talk_ids].each do |talk|
      talk_id = talk.last.to_i

      if talk_id_valid?(talk_id)
        talk = Talk.find(talk_id) 
        group.accept_talk(talk)
      end
    end
    flash[:notice] = t(:you_accepted_talks_to_this_group)
    redirect_to group_path(group)
  end

  private

  def talk_id_valid?(id)
    id > 0
  end
end