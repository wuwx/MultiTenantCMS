# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  category_id :integer
#  user_id     :integer
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :site
  has_many :comments, as: :commentable
  
  has_many :custom_values
  accepts_nested_attributes_for :custom_values

  validates :title, presence: true
  validates :content, presence: true
end
