class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :site
  has_many :comments, as: :commentable
  
  has_many :custom_values

  validates :title, presence: true
  validates :content, presence: true
end
