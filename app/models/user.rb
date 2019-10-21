class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
  before_save { self.first_name = first_name.titleize }
  before_save { self.last_name = last_name.titleize }

  validates :email, uniqueness: true
  has_many :children
  has_many :memories
  has_many :categories, through: :memories
  has_many :children_with_memories, through: :memories, source: :child

  
  # def titleize_name
  #   first_name = self.first_name.titleize
  #   last_name = self.last_name.titleize 
  #   name = first_name + " " + last_name
  # end

   
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0,20]
    end      
  end
  
end
