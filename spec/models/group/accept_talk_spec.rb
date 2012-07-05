require "spec_helper"

describe Group, "accept talk" do
  let(:group) { FactoryGirl.create(:group) }
  let(:talk) { FactoryGirl.create(:talk) }

  before do
    group.submit_talk(talk)

    group.accept_talk(talk)
  end

  it "accepts talk to group" do
    group.accepted_talks.should include talk
  end
end