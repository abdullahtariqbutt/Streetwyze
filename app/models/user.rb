class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :user_name, format: { with: /\A(?=.*?[#?!@$%^&*-]).{4,30}\z/ , message: "User name Requirements not met" }
  validates :password, format: { with: /\A(?=.*[A-Za-z])(?=.*\d).{8,}\z/, message: "Password Requirements not met" }
  
end
