require "spec_helper"

describe Talk, "talk submitions scopes" do
  subject       { FactoryGirl.create :talk }
  let!(:group_1) { FactoryGirl.create :group }
  let!(:group_2) { FactoryGirl.create :group }

  describe "#talk_submition_of" do
    before do
      group_1.submit_talk subject
    end

    it "finds talk submition of a submiting receiver" do
      subject.talk_submition_of(group_1).should == group_1.talk_submitions.first
    end
  end
end