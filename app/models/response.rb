class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :answers
  validates :survey, presence: true
  accepts_nested_attributes_for :answers
end
