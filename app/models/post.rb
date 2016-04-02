class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :user_id, numericality: { only_integer: true }
  validates :title, presence: true
  validates :content, length: {minimum: 50}

end
