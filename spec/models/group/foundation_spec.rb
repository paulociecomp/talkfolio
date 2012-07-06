require "spec_helper"

describe Group, "foundation" do

  subject       { Group.found_by(user, params) }

  let(:user)    { FactoryGirl.create :base_user }
  let(:params)  { { name: "Ta safo!", :description => "Hi!" } }

  it "founds the group" do
    subject.should be_persisted
  end

  it "sets user as group's founder" do
    subject.founder.should == user
  end

  it "returns a new group" do
    subject.should be_kind_of Group
  end
end