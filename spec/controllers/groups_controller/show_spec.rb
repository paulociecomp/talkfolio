require "spec_helper"

describe GroupsController, "GET show" do
  let!(:talk_1) { Talk.create(:title => "Hi", :description => "Hoy!") }
  let!(:talk_2) { Talk.create(:title => "Hi", :description => "Hoy!") }

  before do
    @group = FactoryGirl.create :group
    @group.submit_talk talk_1
    @group.submit_talk talk_2

    get :show, :id => @group.id
  end

  it "returns success" do
    response.should be_success
  end

  it "assigns group" do
    assigns[:group].should be_kind_of Group
  end

  it "assigns group's talks as portfolio" do
    assigns[:portfolio].should == [talk_1, talk_2]
  end
end