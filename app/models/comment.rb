class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :post_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }
  validates :content, length: { minimum: 2, maxium: 1000 }  

end
