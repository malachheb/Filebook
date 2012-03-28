class CreateFavoris < ActiveRecord::Migration
  def up
    create_table :favoris, :id => false do |t|
      t.integer :user_id
      t.integer :fichier_id
    end
  end
  
  def down
     drop_table :favoris
  end
end
