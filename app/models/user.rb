class User < ApplicationRecord
  has_one :survey, dependent: :destroy
  has_many :responses, dependent: :destroy

  has_many :map_assets
  has_many :stories

  USERNAME_REGEX = /\A(?=.*?[#?!@$%^&*-]).{4,30}\z/
  PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d).{8,}\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :user_name, 
    format: {
      with: USERNAME_REGEX ,
      message: " must have one special character and only have a max of 30 characters"
    }
  validates :password,
    format: {
       with: PASSWORD_REGEX,
       message: " should be minimum 8 characters long with atleast one Capital and one Special character"
    }, if: -> { self.password.present? }

  enum role: [:common, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :common
    end
  end

end
