# == Schema Information
#
# Table name: custom_fields
#
#  id         :integer          not null, primary key
#  name       :string
#  site_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CustomField < ActiveRecord::Base
  belongs_to :site
end
