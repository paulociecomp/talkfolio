require "spec_helper"

describe Group, "memberships" do
  subject             { FactoryGirl.create :group }
  let(:pending_user)  { FactoryGirl.create :base_user }
  let(:user)          { FactoryGirl.create :base_user }

  before do
    subject.request_membership_for(pending_user)
    subject.request_membership_for(user)
    subject.accept_member(user)
  end

  describe "#request_membership_for" do
    it "requests a pending membership for user" do
      subject.members.first.should be_pending
    end
  end

  describe "#pending_members" do
    it "returns pending members" do
      subject.pending_members.should include pending_user.member_of(subject)
    end

    it "doesn't return accepted members" do
      subject.pending_members.should_not include user.member_of(subject)
    end

    it "doesn't return nil" do
      subject.pending_members.should_not include nil
    end
  end

  describe "#accepted_members" do
    it "returns accepted talks" do
      subject.accepted_members.should include user.member_of(subject)
    end

    it "doesn't return other talks" do
      subject.accepted_members.should_not include pending_user.member_of(subject)
    end

    it "doesn't return nil" do
      subject.accepted_members.should_not include nil
    end
  end

  describe "#accept_member" do
    it "accepts member to group" do
      subject.accepted_members.should include user.member_of(subject)
    end
  end
end