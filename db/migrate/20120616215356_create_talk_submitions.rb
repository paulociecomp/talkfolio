class CreateTalkSubmitions < ActiveRecord::Migration
  def up
    create_table :talk_submitions do |t|
      t.references :talk, :null => false
      t.string :submition_receiver_type, :null => false
      t.references :submition_receiver, :null => false
    end
  end

  def down
    drop_table :talk_submitions
  end
end
