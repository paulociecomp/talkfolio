require "spec_helper"

describe Group, "submit talk" do
  let(:group) { FactoryGirl.create(:group) }
  let(:talk) { FactoryGirl.create(:talk) }

  before do
    group.submit_talk(talk)
  end

  it "adds talk to group as pending" do
    group.pending_talks.should include talk
  end
end