class AddFounderToGroups < ActiveRecord::Migration
  def up
    add_column :groups, :founder_id, :integer, :null => false, :default => 1
    change_column :groups, :founder_id, :integer, :default => nil
  end

  def down
    remove_column :groups, :founder_id
  end
end
