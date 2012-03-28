class Follow < ActiveRecord::Base
  belongs_to :userto, :class_name => "User"
  belongs_to :userfrom, :class_name => "User"
end
