require "spec_helper"

describe MembersController, "GET :edit" do
  let(:user)    { FactoryGirl.create :base_user }

  let!(:group)  { FactoryGirl.create :group }

  context "as signed in user" do
    before do
      sign_in user
      group.request_membership_for(user)

      get :edit, :group_id => group.id
    end

    it "returns success" do
      response.should be_success
    end

    it "assigns group" do
      assigns[:group].should == group
    end

    it "assigns pending members" do
      assigns[:pending_members].should include user.member_of(group)
    end
  end

  context "as signed out user" do
    before do
      get :edit, :group_id => group.id
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end