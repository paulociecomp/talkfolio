require "spec_helper"

describe TalksController, "my talks" do
  it "GET my_talks" do
    get :my_talks
    response.should be_success
  end
end