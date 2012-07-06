class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.boolean     :accepted, :default => false
      t.references  :user,     :null => false
      t.references  :group,    :null => false
      t.string      :role
    end
  end

  def down
    drop_table :members
  end
end
