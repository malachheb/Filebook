class User < ActiveRecord::Base
  
  has_many :fichiers, :dependent => :destroy

  # has_many :myshared, :as => :owner, :source => :shared_fichier, :dependent => :destroy
  has_many :shared_fichiers_to_me, :foreign_key => "dist_id", :class_name => "SharedFichier"
  has_many :sharedtome, :through => :shared_fichiers_to_me, :source => :fichier, :dependent => :destroy
 
  has_many :shared_fichiers_from_me, :foreign_key => "owner_id",  :class_name => "SharedFichier"
  has_many :sharedfromme, :through => :shared_fichiers_from_me, :source => :fichier, :dependent => :destroy

  has_many :favoris
  has_many :myfavoris, :through => :favoris, :source => :fichier

  has_many :follows_from, :foreign_key => "userfrom_id", :class_name => "Follow"
  has_many :following, :through => :follows_from, :source => :user

  has_many :follows_to, :foreign_key => "userto_id", :class_name => "Follow"
  has_many :followers, :through => :follows_to, :source => :user
  
  attr_accessible :email, :password, :password_confirmation, :pseudo, :first_name, :last_name
  
  has_many :topics, :dependent => :destroy
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
