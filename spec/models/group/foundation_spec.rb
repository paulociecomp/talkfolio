require "spec_helper"

describe Group, "foundation" do

  subject       { Group }
  let(:params)  { { name: "Ta safo!", :description => "Hi!" } }

  it "saves the group in the data base" do
    group = subject.found(params)
    group.should be_persisted
  end

  it "returns a new group" do
    subject.found(params).should be_kind_of Group
  end
end