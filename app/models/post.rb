class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :content, presence: true
end
