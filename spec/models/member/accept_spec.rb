require "spec_helper"

describe Member do

  subject { FactoryGirl.create :member }

  it "is accepted" do
    subject.accept!
    subject.should be_accepted
  end
end