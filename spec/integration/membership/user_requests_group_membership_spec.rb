require "spec_helper"

describe "User requests a group membership" do
  let(:group) { FactoryGirl.create :group }

  before do
    integration_sign_in!

    visit group_path(group)

    click_link "Join group"
  end

  it "shows message" do
    page.should have_content "A membership request was sent to this group moderators. Please wait for their response."
  end
  
  it "redirects_to group path" do
    current_path.should == group_path(group)
  end
end