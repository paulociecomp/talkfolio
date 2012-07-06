require "spec_helper"

describe GroupsController, "POST :create" do

  let(:user) { FactoryGirl.create :base_user }

  context "as signed in user" do
    context "with valid params" do
      before do
        sign_in user
        post :create, :group => { :name => "Ta Safo!", :description => "Hi again!" }
      end

      it "redirects to the founded group path" do
        @group = Group.last
        response.should redirect_to group_path(@group)
      end

      it "founds group" do
        assigns[:group].should be_persisted
      end

      it "sends flash notice" do
        flash[:notice].should == "You founded a new group!"
      end
    end

    context "as signed out user" do
      before do
        post :create, :group => { :name => "Ta Safo!", :description => "Hi again!" }
      end

      it "redirects to new user session path" do
        response.should redirect_to new_user_session_path
      end
    end
  end
end