class Post < ActiveRecord::Base

validates :user_id, numericality: { only_integer: true }
validates :title, presence: true
validates :content, length: {minimum: 50}

end
