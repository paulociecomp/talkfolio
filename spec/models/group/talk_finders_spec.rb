require "spec_helper"

describe Group, "talk finders" do
  subject       { FactoryGirl.create :group }
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }
  
  before do
    subject.submit_talk talk_1
  end

  describe "#pending_talks" do
    it "returns pending talks" do
      subject.pending_talks.should include talk_1
    end

    it "doesn't return accepted talks" do
      subject.pending_talks.should_not include talk_2
    end

    it "doesn't return nil" do
      subject.pending_talks.should_not include nil
    end
  end

  describe "#accepted_talks" do
    before do
      subject.accept_talk talk_1
    end

    it "returns accepted talks" do
      subject.accepted_talks.should include talk_1
    end

    it "doesn't return other talks" do
      subject.accepted_talks.should_not include talk_2
    end

    it "doesn't return nil" do
      subject.accepted_talks.should_not include nil
    end
  end
end