# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  slug       :string
#  title      :string
#  theme      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :pages
  has_many :posts
  has_many :links
  has_many :comments
  has_many :tags
  has_many :custom_fields

  #validates :name, presence: true, uniqueness: true, length: { in: 4..16 }, format: { with: /\A[0-9a-z]+\z/ }
  validates :title, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
