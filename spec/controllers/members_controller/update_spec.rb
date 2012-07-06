require "spec_helper"

describe MembersController, "PUT :accept" do

  let(:user_1)    { FactoryGirl.create :base_user }
  let(:user_2)    { FactoryGirl.create :base_user }

  let!(:group)  { FactoryGirl.create :group }

  let(:user_ids) { {"user_#{user_1.id}" => user_1.id, "user_#{user_2.id}" => user_2.id} }
  
  context "as signed in user" do
    before do
      sign_in user_1
      group.request_membership_for user_1
      group.request_membership_for user_2
    end

    context "with valid params" do
      before do
        put :accept, :group_id => group.id, :user_ids => user_ids, :action => :accept
      end

      it "accepts talks" do
        user_1.member_of(group).should be_accepted
        user_2.member_of(group).should be_accepted
      end

      it "redirects to group member's path" do
        response.should redirect_to group_members_path(group)
      end

      it "sends flash notice" do
        flash[:notice].should == "You accepted membership requests of this group."
      end
    end
  end

  context "with blank ids" do
    it "doesn't raise error" do
      expect {
        put :accept, :group_id => group.id
      }.to_not raise_error
    end
  end

  context "as signed out user" do
    before do
      put :accept, :group_id => group.id
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end