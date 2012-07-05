require "spec_helper"

describe TalkSubmitionsController, "PUT :accept" do

  let!(:group)  { FactoryGirl.create :group }
  let!(:talk_1) { FactoryGirl.create :talk }
  let!(:talk_2) { FactoryGirl.create :talk }

  let(:talk_ids) { [ talk_1.id, talk_2.id ]
  }

  context "with valid params" do
    before do
      group.submit_talk talk_1
      group.submit_talk talk_2

      put :accept, :group_id => group.id, :talk_ids => talk_ids, :action => :accept
    end

    it "accepts talks" do
      talk_1.talk_submition_of(group).should be_accepted
      talk_2.talk_submition_of(group).should be_accepted
    end

    it "redirects to group path" do
      response.should redirect_to group_path(group)
    end

    it "sends flash notice" do
      flash[:notice].should == "You accepted talks to this group."
    end
  end
end