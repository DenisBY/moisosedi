# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ActiveRecord::Base
  attr_accessible :address, :id
  has_many :user, :foreign_key => "houses_id"
  has_many :water_infos, :through => :user
end
