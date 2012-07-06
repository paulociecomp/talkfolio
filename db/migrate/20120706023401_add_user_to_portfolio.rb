class AddUserToPortfolio < ActiveRecord::Migration
  def up
    add_column :talks, :user_id, :integer, :null => false, :default => 1
    change_column :talks, :user_id, :integer, :default => nil
  end

  def down
    remove_column :talks, :user_id
  end
end
