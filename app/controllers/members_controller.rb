class MembersController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @group = Group.find(params[:group_id])
    @members = @group.accepted_members
  end

  def create
    group = Group.find(params[:group_id])
    
    group.request_membership_for(current_user)

    flash[:notice] = t(:membership_request_was_sent_to_moderators)
    redirect_to group
  end

  def edit
    @group = Group.find(params[:group_id])
    @pending_members = @group.pending_members
  end

  def accept
    group = Group.find(params[:group_id])

    params[:user_ids].each do |user|
      user_id = user.last.to_i

      if user_id_valid?(user_id)
        user = User.find(user_id) 
        group.accept_member(user)
      end
    end

    flash[:notice] = t(:you_accepted_membership_requests_for_group)
    redirect_to group_members_path(group)
  end

  private

  def user_id_valid?(id)
    id > 0
  end
end