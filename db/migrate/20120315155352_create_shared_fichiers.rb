class CreateSharedFichiers < ActiveRecord::Migration
  def change
    create_table :shared_fichiers do |t|
      t.integer :owner_id
      t.integer :dist_id
      t.integer :fichier_id

      t.timestamps
    end
  end
end
