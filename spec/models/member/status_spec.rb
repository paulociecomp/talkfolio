require "spec_helper"

describe Member, "status" do
  
  it "is pending" do
    subject.accepted = false
    subject.pending?.should be_true
  end
end