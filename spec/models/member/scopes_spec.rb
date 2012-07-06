require "spec_helper"

describe Member, "scopes" do
  subject { Member }

  let!(:accepted_member) { FactoryGirl.create :accepted_member }
  let!(:pending_member)  { FactoryGirl.create :member }

  it "returns accepted members" do
    subject.accepted.should include accepted_member
  end

  it "returns pending members" do
    subject.pending.should include pending_member
  end
end