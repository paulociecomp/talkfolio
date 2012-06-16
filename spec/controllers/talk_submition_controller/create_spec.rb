require "spec_helper"

describe TalkSubmitionsController, "POST :create" do

  let!(:group) { Group.create(:name => "Hi", :description => "Hoy!") }
  let!(:talk) { Talk.create(:title => "Ruby", :description => "Hi!") }

  context "with valid params" do
    before do
      post :create, :group_id => group.id, :talk => { :id => talk.id }
    end

    it "redirects to group path" do
      response.should redirect_to group_path(group)
    end

    it "submits talk to group" do
      assigns[:group].talks.should include talk
    end

    it "sends flash notice" do
      flash[:notice].should == "You submited a talk to this group."
    end

    it "assigns group" do
      assigns[:group].should == group
    end
  end
end