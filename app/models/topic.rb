class Topic < ActiveRecord::Base

  belongs_to :object, :polymorphic => true
  belongs_to :user

end
