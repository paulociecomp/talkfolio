require "spec_helper"

describe TalksController, "GET :my_talks" do
  let!(:users_talk) { FactoryGirl.create :talk, :user_id => user.id }
  let!(:talk_2) { FactoryGirl.create :talk, :user_id => 100 }

  let(:user)    { FactoryGirl.create :base_user }

  context "as signed in user" do
    before do
      sign_in user
      get :my_talks
    end

    it "returns success" do
      response.should be_success
    end

    it "assigns user's talks" do
      assigns[:talks].should == [users_talk]
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