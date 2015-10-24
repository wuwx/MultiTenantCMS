class Page < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  has_many :comments, as: :commentable

  acts_as_list scope: :site
  acts_as_tree

  validates :title, presence: true
  validates :content, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
