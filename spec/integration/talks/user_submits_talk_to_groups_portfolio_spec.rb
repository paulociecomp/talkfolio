require "spec_helper"

describe "User submits talk to group's portfolio" do
  let!(:group) { FactoryGirl.create :group }
  let!(:talk)  { FactoryGirl.create :talk }

  before do
    integration_sign_in!
    
    click_link "My groups"
    click_link group.name
    click_link "Submit talk"

    select "Ruby", :from => "talk_id"
  
    click_button "Submit talk"
  end

  it "shows success message" do
    page.should have_content "You submited a talk to this group."
  end

  it "redirects to the group's path" do
    current_path.should == group_path(group)
  end

  it "submits talk to group" do
    group.talks.should include talk
  end
end