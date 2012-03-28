class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :userto_id
      t.integer :userfrom_id

      t.timestamps
    end
  end
end
