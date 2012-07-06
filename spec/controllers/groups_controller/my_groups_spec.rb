require "spec_helper"

describe GroupsController, "GET :my_groups" do

  let(:user)     { FactoryGirl.create :base_user }

  let!(:group_1) { FactoryGirl.create :group }
  let!(:group_2) { FactoryGirl.create :group }
  
  context "as signed in user" do
    before do
      sign_in user
      get :my_groups
    end

    it "responds successfully" do
      response.should be_success
    end

    it "assigns all groups" do
      assigns[:groups].should == [group_1, group_2]
    end
  end

  context "as signed out user" do
    before do
      get :my_groups
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end