class AddNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string, :null => false, :default => "Nameless"
    change_column :users, :name, :string, :default => nil
  end

  def down
    remove_column :groups, :name
  end
end
