require "spec_helper"

describe TalksController, "create" do
  context "POST create" do
  
    context "with valid params" do
      before do
        post :create, :talk => { :title => "Hi!", :description => "Hi again!" }
      end

      it "redirects to my talks path" do
        response.should redirect_to my_talks_path
      end

      it "adds talk to portfolio" do
        assigns[:talk].should be_persisted
      end

      it "sends flash notice" do
        flash[:notice].should == "You added a new talk to your portfolio!"
      end
    end
  end
end