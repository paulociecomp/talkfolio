require "spec_helper"

describe Talk, "add to portfolio" do

  subject { Talk.new(:title => "Hello", :description => "Hello world") }

  it "saves the talk in the data base" do
    
    subject.add_to_portfolio
    subject.id.should_not be_nil
  end
end