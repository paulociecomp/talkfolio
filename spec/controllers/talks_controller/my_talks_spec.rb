require "spec_helper"

describe TalksController, "GET :my_talks" do
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }

  let(:user)    { FactoryGirl.create :base_user }

  context "as signed in user" do
    before do
      sign_in user
      get :my_talks
    end

    it "returns success" do
      response.should be_success
    end

    it "assigns all talks" do
      assigns[:talks].should == [talk_1, talk_2]
    end
  end

  context "with signed out user" do
    before do
      get :my_talks
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end