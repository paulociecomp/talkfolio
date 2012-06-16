class GroupsController < ApplicationController
  def my_groups
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.found(params[:group])
    flash[:notice] = t(:you_founded_a_new_group)
    redirect_to @group
  end
end