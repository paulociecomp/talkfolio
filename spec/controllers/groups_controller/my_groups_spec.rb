require "spec_helper"

describe GroupsController, "my groups" do
  context "GET my_groups" do
    before do
      get :my_groups
    end

    it "responds successfully" do
      response.should be_success
    end
  end
end