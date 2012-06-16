require "spec_helper"

describe GroupsController, "GET my_groups" do
  let!(:group_1) { Group.new(:name => "Hi", :description => "Hoy!").found }
  let!(:group_2) { Group.new(:name => "Hi", :description => "Hoy!").found }


  before do
    get :my_groups
  end

  it "responds successfully" do
    response.should be_success
  end

  it "assigns all groups" do
    assigns[:groups].should == [group_1, group_2]
  end
end