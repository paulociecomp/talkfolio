require "spec_helper"

describe Group, "memberships" do
  subject     { FactoryGirl.create :group }
  let(:user)  { FactoryGirl.create :base_user }

  describe "#request_membership_for" do

    before do
      subject.request_membership_for(user)
    end

    it "requests a pending membership for user" do
      subject.members.first.should be_pending
    end
  end
end