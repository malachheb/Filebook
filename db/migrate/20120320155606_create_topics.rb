class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string  :action_type
      t.integer :object_id
      t.string  :object_type
      t.timestamps
    end
  end
end
