class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers

  validates :survey, presence: true
end
