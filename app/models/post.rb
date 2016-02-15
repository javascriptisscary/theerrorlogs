class Post < ActiveRecord::Base

  belongs_to :user

  validates :user_id, numericality: { only_integer: true }
  validates :title, presence: true
  validates :content, length: {minimum: 50}

end
