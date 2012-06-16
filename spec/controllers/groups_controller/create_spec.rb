require "spec_helper"

describe GroupsController, "create" do
  context "POST create" do
  
    context "with valid params" do
      before do
        post :create, :group => { :name => "Ta Safo!", :description => "Hi again!" }
        @group = Group.last
      end

      it "redirects to the founded group path" do
        response.should redirect_to group_path(@group)
      end

      it "founds group" do
        assigns[:group].should be_persisted
      end

      it "sends flash notice" do
        flash[:notice].should == "You founded a new group!"
      end
    end
  end
end