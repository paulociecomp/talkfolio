require "spec_helper"

describe GroupsController, "GET :show" do
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }

  before do
    @group = FactoryGirl.create :group
    @group.submit_talk talk_1
    @group.submit_talk talk_2
    @group.accept_talk talk_2

    get :show, :id => @group.id
  end

  it "returns success" do
    response.should be_success
  end

  it "assigns group" do
    assigns[:group].should be_kind_of Group
  end

  it "assigns group's accepted talks as portfolio" do
    assigns[:portfolio].should == [talk_2]
  end
end