require "spec_helper"

describe TalksController, "my talks" do
  let!(:talk_1) { Talk.new(:title => "Hi", :description => "Hoy!").add_to_portfolio }
  let!(:talk_2) { Talk.new(:title => "Hi", :description => "Hoy!").add_to_portfolio }

  context "GET my_talks" do
    before do
      get :my_talks
    end

    it "responds successfully" do
      response.should be_success
    end

    it "assigns all talks" do
      assigns[:talks].should == [talk_1, talk_2]
    end
  end
end