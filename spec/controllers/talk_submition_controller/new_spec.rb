require "spec_helper"

describe TalkSubmitionsController, "GET :new" do
  let(:user)    { FactoryGirl.create :base_user }  
  let!(:group)  { FactoryGirl.create :group }
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }

  context "as signed in user" do
    before do
      sign_in user
      get :new, :group_id => group.id
    end

    it "returns success" do
      response.should be_success
    end

    it "assigns group" do
      assigns[:group].should == group
    end

    it "assigns all talks" do
      assigns[:talks].should == [talk_1, talk_2]
    end
  end

  context "as signed out user" do
    before do
      get :new, :group_id => group.id
    end

    it "redirects to new user session path" do
      response.should redirect_to new_user_session_path
    end
  end
end