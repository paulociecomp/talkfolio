require "spec_helper"

describe Talk, "add to portfolio" do
  let(:user) { FactoryGirl.create :base_user }
  subject { Talk.new(:title => "Hello", :description => "Hello world") }

  it "saves the talk in the data base" do
    subject.add_to_user_portfolio(user)
    subject.should be_persisted
  end

  it "returns talk" do
    subject.add_to_user_portfolio(user).should == subject
  end
end