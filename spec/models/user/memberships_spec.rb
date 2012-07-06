require "spec_helper"

describe User, "memberships" do
  subject     { FactoryGirl.create :base_user }

  let(:group) { FactoryGirl.create :group }

  before do
    group.request_membership_for(subject)
  end

  describe "#member_of" do
    it "returns membership of group" do
      subject.member_of(group).should == group.members.first
    end
  end
end