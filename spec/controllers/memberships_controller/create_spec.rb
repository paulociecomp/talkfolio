require "spec_helper"

describe MembershipsController, "POST :create" do
  let(:user)    { FactoryGirl.create :base_user }
  let!(:group)  { Group.create(:name => "Hi", :description => "Hoy!") }

  context "as signed in user" do
    context "with valid params" do
      before do
        sign_in user
        post :create, 
          :group_id => group.id, 
          :talk => { :title => "Hi!", :description => "Hi again!" }
      end

      it "redirects to group's path" do
        response.should redirect_to group_path(group)
      end

      it "sends flash notice" do
        flash[:notice].should == "A membership request was sent to this group moderators. Please wait for their response."
      end

      it "requests a pending membership" do
        user.member_of(group).should be_pending
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