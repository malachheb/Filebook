class Fichier < ActiveRecord::Base
 
  #attr_accessible :myshared_tokens
  attr_reader :myshared_tokens

  belongs_to :user
  has_many :favoris, :dependent => :delete_all
  has_many :users_favori, :through => :favoris, :source => :user
  
  #has_many :shared, :as => :fichier, :source => :shared_fichier, :dependent => :destroy

  has_many :topics, :as => :object, :dependent => :destroy
  
  has_attached_file :data
 
  
# Validations Fichier model
  validates_attachment_presence :data 
  validates_attachment_size :data, :less_than=>1.megabyte, 
                            :if => Proc.new { |imports| !imports.data_file_name.blank? }
  validates :tags, :presence => true


   def myshared_tokens=(ids)
     ids.split(",")  
   end
 
   after_create do
     Topic.create(:user_id => self.user_id, :object => self, :action_type => 'create')
   end
   after_update do 
     Topic.create(:user_id => self.user_id, :object => self, :action_type => 'update')
   end
   
  
end
