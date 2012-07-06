require "spec_helper"

describe TalksController, "GET :new" do

  let(:user)    { FactoryGirl.create :base_user }

  context "as signed in user" do
    before do
      sign_in user
      get :new
    end

    it "returns success" do
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