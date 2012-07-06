class MembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    group = Group.find(params[:group_id])
    
    group.request_membership_for(current_user)

    flash[:notice] = t(:membership_request_was_sent_to_moderators)
    redirect_to group
  end
end