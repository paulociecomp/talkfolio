require "spec_helper"

describe GroupsController, "GET :new" do

  let(:user) { FactoryGirl.create :base_user }

  context "as signed in user" do
    it "retuns success" do
      sign_in user
      get :new
      response.should be_success
    end
  end

  context "with signed out user" do
    before do
      get :new
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end