class Site < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :pages
  has_many :posts
  has_many :links
  has_many :comments
  has_many :tags

  #validates :name, presence: true, uniqueness: true, length: { in: 4..16 }, format: { with: /\A[0-9a-z]+\z/ }
  validates :title, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
