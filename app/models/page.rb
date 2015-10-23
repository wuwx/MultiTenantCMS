class Page < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  has_many :comments, as: :commentable
  
  acts_as_list scope: :site
  acts_as_tree

  validates :title, presence: true
  validates :content, presence: true
  
  def to_param
    title
  end
end
