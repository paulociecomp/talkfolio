require "spec_helper"

describe TalkSubmitionsController, "GET 'new'" do
  let!(:group) { Group.create(:name => "Ta safo", :description => "Hi!") }
  let!(:talk_1) { Talk.create(:title => "Hi", :description => "Hoy!") }
  let!(:talk_2) { Talk.create(:title => "Hi", :description => "Hoy!") }

  before do
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