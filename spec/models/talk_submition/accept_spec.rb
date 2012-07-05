require "spec_helper"

describe TalkSubmition do

  subject { FactoryGirl.create :talk_submition }

  it "is accepted" do
    subject.accept
    subject.should be_accepted
  end
end