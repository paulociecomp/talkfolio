require "spec_helper"

describe TalkSubmitionsController, "GET :edit" do
  let!(:group)   { FactoryGirl.create :group }
  let!(:talk_1)  { FactoryGirl.create :talk }
  let!(:talk_2)  { FactoryGirl.create :talk }

  before do
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