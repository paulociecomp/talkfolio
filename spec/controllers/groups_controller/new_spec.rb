require "spec_helper"

describe GroupsController, "new" do
  it "GET new" do
    get :new
    response.should be_success
  end
end