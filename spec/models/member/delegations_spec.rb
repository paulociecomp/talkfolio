require "spec_helper"

describe Member, "delegates" do
  subject { FactoryGirl.create(:member, :user => user) }

  let!(:user) { FactoryGirl.create :base_user }

  it ":email to its user" do
    subject.email.should == user.email
  end

  it ":name to its user" do
    subject.name.should == user.name
  end
end