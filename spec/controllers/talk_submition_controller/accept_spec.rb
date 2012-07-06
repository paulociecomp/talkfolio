require "spec_helper"

describe TalkSubmitionsController, "PUT :accept" do

  let(:user)    { FactoryGirl.create :base_user }

  let!(:group)  { FactoryGirl.create :group }
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }

  let(:talk_ids) { {"talk_#{talk_1.id}"=>talk_1.id, "talk_#{talk_2.id}"=>talk_2.id} }
  
  context "as signed in user" do
    before do
      sign_in user
      group.submit_talk talk_1
      group.submit_talk talk_2
    end

    context "with valid params" do
      before do
        put :accept, :group_id => group.id, :talk_ids => talk_ids, :action => :accept
      end

      it "accepts talks" do
        talk_1.talk_submition_of(group).should be_accepted
        talk_2.talk_submition_of(group).should be_accepted
      end

      it "redirects to group path" do
        response.should redirect_to group_path(group)
      end

      it "sends flash notice" do
        flash[:notice].should == "You accepted talks to this group."
      end
    end
  end

  context "with blank ids" do
    it "doesn't raise error" do
      expect {
        put :accept, :group_id => group.id, :talk_ids => {:id => 0}, :action => :accept
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