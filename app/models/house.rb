class House < ActiveRecord::Base
  attr_accessible :address, :id
  has_many :user, :foreign_key => "houses_id"
  has_many :water_infos, :through => :user
end
