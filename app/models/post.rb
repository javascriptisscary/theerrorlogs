class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]


  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :user_id, numericality: { only_integer: true }
  validates :title, presence: true
  validates :content, length: {minimum: 2, maximum: 10000}

end
