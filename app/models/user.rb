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
