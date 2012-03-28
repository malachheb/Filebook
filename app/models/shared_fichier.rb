class SharedFichier < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User' 
  belongs_to :fichier
  belongs_to :dist, :class_name => 'User'

  has_many :topics, :as => :object

end
