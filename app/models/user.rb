class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :user_name, format: { with: /\A(?=.*?[#?!@$%^&*-]).{4,30}\z/ , message: " must have one special character and only have a max of 30 characters" }
  validates :password, format: { with: /\A(?=.*[A-Za-z])(?=.*\d).{8,}\z/, message: "should be minimum 8 characters long with atleast one Capital and one Special character" }
  
end
