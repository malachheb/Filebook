class CreateFichiers < ActiveRecord::Migration
  def change
    create_table :fichiers do |t|
      t.string :fhash
      t.has_attached_file :data
      t.string :data_file_name
      t.string :extension
      t.string :data_content_type
      t.integer :data_file_size
      t.string :tags

      t.timestamps
    end
  end
end
