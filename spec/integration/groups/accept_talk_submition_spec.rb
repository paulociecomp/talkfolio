require "spec_helper"

describe "Group admin accepts many talk submitions at once" do
  let(:group) { FactoryGirl.create :group }
  let(:talk_1)  { FactoryGirl.create :talk, :title => "Loving Ruby" }
  let(:talk_2)  { FactoryGirl.create :talk, :title => "Loving Ruby 2" }
  let(:talk_3)  { FactoryGirl.create :talk, :title => "Loving Ruby 3" }

  before do
    group.submit_talk(talk_1)
    group.submit_talk(talk_2)
    group.submit_talk(talk_3)

    visit group_path(group)
    click_link "Manage talks"

    within "#pending_talks" do
      check talk_1.title
      check talk_2.title
      click_button "Accept"
    end
  end

  it "shows success message" do
    page.should have_content "You accepted talks to this group."
  end

  it "redirects to group path" do
    current_path.should == group_path(group)
  end

  it "shows talks in the list" do
    page.should have_content "Loving Ruby"
    page.should have_content "Loving Ruby 2"
    page.should_not have_content "Loving Ruby 3"
  end
end