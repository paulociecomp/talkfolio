require "spec_helper"

describe TalksController, "new" do
  it "GET new" do
    get :new
    response.should be_success
  end
end