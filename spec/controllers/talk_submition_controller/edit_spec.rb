require "spec_helper"

describe TalkSubmitionsController, "GET :edit" do
  let(:user)    { FactoryGirl.create :base_user }

  let!(:group)  { FactoryGirl.create :group }
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }

  context "as signed in user" do
    before do
      sign_in user
      @group = FactoryGirl.create :group
      @group.submit_talk talk_1

      get :edit, :group_id => @group.id
    end

    it "returns success" do
      response.should be_success
    end

    it "assigns group" do
      assigns[:group].should == @group
    end

    it "assigns pending_talks" do
      assigns[:pending_talks].should include talk_1
    end
  end

  context "as signed out user" do
    before do
      get :edit, :group_id => group.id
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end