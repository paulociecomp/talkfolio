require "spec_helper"

describe Group, "foundation" do

  subject       { Group.new(params) }
  let(:params)  { { name: "Ta safo!", :description => "Hi!" } }

  it "saves the group in the data base" do
    subject.found.should be_persisted
  end

  it "returns a new group" do
    subject.found.should be_kind_of Group
  end
end