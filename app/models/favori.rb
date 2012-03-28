# app/models/favori.rb
class Favori < ActiveRecord::Base
  belongs_to :user
  belongs_to :fichier
 
  # validates :user, :presence => true
  # validates :fichier, :presence => true

end
