class Site < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :links

  validates :name, presence: true, uniqueness: true, length: { in: 4..16 }, format: { with: /\A[0-9a-z]+\z/ }
  validates :title, presence: true, uniqueness: true
end
