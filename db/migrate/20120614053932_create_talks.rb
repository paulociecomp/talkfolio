class CreateTalks < ActiveRecord::Migration
  def up
    create_table :talks do |t|
      t.string :title,        :null => false
      t.string :description,  :null => false
    end
  end

  def down
    drop_table :talks
  end
end
