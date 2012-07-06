require "spec_helper"

describe "Group admin accepts membership request" do
  let(:group) { FactoryGirl.create :group }
  let(:user_1)  { FactoryGirl.create :base_user, :name => "Felipe" }
  let(:user_2)  { FactoryGirl.create :base_user, :name => "Luiz" }
  let(:user_3)  { FactoryGirl.create :base_user, :name => "Fabio" }

  before do
    group.request_membership_for(user_1)
    group.request_membership_for(user_2)
    group.request_membership_for(user_3)

    integration_sign_in!

    visit group_path(group)
    click_link "Members"
    click_link "Manage members"

    within "#pending_members" do
      check user_1.email
      check user_2.email
      click_button "Accept"
    end
  end

  it "shows success message" do
    page.should have_content "You accepted membership requests of this group."
  end

  it "redirects to group path" do
    current_path.should == group_members_path(group)
  end

  it "shows members in the list" do
    page.should have_content "Felipe"
    page.should have_content "Luiz"
    page.should_not have_content "Fabio"
  end
end