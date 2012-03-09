class Fichier < ActiveRecord::Base
  has_attached_file :data
  validates :tags, :presence => true
end
