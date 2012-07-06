require "spec_helper"

describe TalksController, "GET :talker" do
  
  let!(:talker) { FactoryGirl.create :base_user }

  before do
    get :talker, :talker_id => talker.id
  end

  it "returns success" do
    response.should be_success
  end

  it "assigns talker" do
    assigns[:talker].should == talker
  end
end