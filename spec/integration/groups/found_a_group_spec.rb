require "spec_helper"

describe "User founds a group" do

  context "with valid inputs" do
    before do
      integration_sign_in!

      click_link "My groups"
      click_link "Found a group"

      fill_in "Name", :with => "The rubists"
      fill_in "Description", :with => "We are crazy, only crazy"

      click_button "Found group"
    end

    it "shows success message" do
      page.should have_content "You founded a new group!"
    end

    it "redirects to the founded group" do
      group = Group.last
      current_path.should == group_path(group) 
    end
  end
end