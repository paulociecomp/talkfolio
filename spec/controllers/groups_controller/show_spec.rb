require "spec_helper"

describe GroupsController, "GET show" do
  before do
    @group = Group.found(name: "Ta safo!", description: "Hi!")
    get :show, :id => @group.id
  end

  it "returns success" do
    response.should be_success
  end

  it "assigns group" do
    assigns[:group].should be_kind_of Group
  end
end