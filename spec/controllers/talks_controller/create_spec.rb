require "spec_helper"

describe TalksController, "POST :create" do
  let(:user)    { FactoryGirl.create :base_user }

  context "as signed in user" do
    context "with valid params" do
      before do
        sign_in user
        post :create, :talk => { :title => "Hi!", :description => "Hi again!" }
      end

      it "redirects to my talks path" do
        response.should redirect_to my_talks_path
      end

      it "adds talk to users portfolio" do
        user.talks.should include assigns[:talk]
      end

      it "sends flash notice" do
        flash[:notice].should == "You added a new talk to your portfolio!"
      end
    end
  end

  context "with signed out user" do
    before do
      post :create
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end