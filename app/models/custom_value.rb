# == Schema Information
#
# Table name: custom_values
#
#  id              :integer          not null, primary key
#  value           :text
#  custom_field_id :integer
#  post_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CustomValue < ActiveRecord::Base
  belongs_to :custom_field
  belongs_to :post
end
