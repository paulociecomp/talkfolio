require "spec_helper"

describe "Group admin accepts a talk submition" do
  let(:group) { FactoryGirl.create :group }
  let(:talk)  { FactoryGirl.create :talk, :title => "Loving Ruby" }

  before do
    group.submit_talk(talk)

    visit group_path(group)
    click_link "Manage talks"

    within "#pending_talks" do
      check talk.title
      click_button "Accept"
    end
  end

  it "shows success message" do
    page.should have_content "You accepted talks to this group."
  end

  it "redirects to group path" do
    current_path.should == group_path(group)
  end

  it "shows talk in the list" do
    page.should have_content "Loving Ruby"
  end
end