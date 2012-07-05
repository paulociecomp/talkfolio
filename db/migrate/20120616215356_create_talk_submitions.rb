class CreateTalkSubmitions < ActiveRecord::Migration
  def up
    create_table :talk_submitions do |t|
      t.references :talk, :null => false
      t.string :receiver_type, :null => false
      t.boolean :accepted, :default => false
      t.references :receiver, :null => false
    end
  end

  def down
    drop_table :talk_submitions
  end
end
