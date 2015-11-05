# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string
#  name       :string
#  image      :string
#  site_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  belongs_to :site
end
