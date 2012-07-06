require "spec_helper"

describe Member, "roles" do
  
  subject { FactoryGirl.create :member, :role => nil }

  it "checks founder role" do
    subject.change_role :founder
    subject.founder?.should be_true
  end

  it "checks admin role" do
    subject.change_role :admin
    subject.admin?.should be_true
  end

  it "can be changed" do
    subject.change_role :founder
    subject.should be_founder
  end
end