class Follower < ActiveRecord::Base

 has_many :follows
 has_many :users, through: :follows
  
end