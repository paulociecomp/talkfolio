require "spec_helper"

describe MembersController, "GET :index" do
  let!(:group) { FactoryGirl.create :group }
  let!(:user) { FactoryGirl.create :base_user }
  let!(:pending_user) { FactoryGirl.create :base_user }

  before do
    group.request_membership_for(pending_user)
    group.request_membership_for(user)
    group.accept_member(user)

    get :index, :group_id => group.id
  end

  it "returns success" do
    response.should be_success
  end

  it "assigns group" do
    assigns[:group].should == group
  end

  it "assigns group's accepted members" do
    assigns[:members].should include user.member_of(group)
  end
end