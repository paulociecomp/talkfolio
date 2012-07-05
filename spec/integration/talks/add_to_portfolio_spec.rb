require "spec_helper"

describe "Add talk to portfolio" do
  before do

    integration_sign_in!
    
    click_link "My talks"
    click_link "Add talk"

    fill_in "Title",        :with => "Rails Tests"
    fill_in "Description",  :with => "Why you should learn TDD"

    click_button "Add talk to my portfolio"
  end

  context "with valid inputs" do
    it "shows success message" do
      page.should have_content "You added a new talk to your portfolio!"
    end

    it "redirects to my talks" do
      current_path.should == my_talks_path
    end

    it "shows the new talk" do
      page.should have_content "Rails Tests"
    end
  end
end