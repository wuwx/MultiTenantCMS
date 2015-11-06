# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  user_id    :integer
#  slug       :string
#  title      :string
#  content    :text
#  parent_id  :integer
#  lft        :integer          not null
#  rgt        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  has_many :comments, as: :commentable

  acts_as_nested_set :scope => :site

  validates :title, presence: true
  validates :content, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
