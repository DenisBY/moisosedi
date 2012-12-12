# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  flat                   :integer
#  owner                  :string(255)
#  contacts               :string(255)
#  houses_id              :integer
#  square                 :string(255)
#  role                   :string(255)
#  email                  :string(255)
#  login                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login, :password, :password_confirmation, :remember_me, :id, :flat, :owner, :contacts, :houses_id, :square, :role
  # attr_accessible :title, :body
  belongs_to :house, :foreign_key => "houses_id"
  has_many :water_infos
  
  def email_required?
    false
  end
end
