class Response < ApplicationRecord
  belongs_to :survey
  has_many :questions
  has_many :answers
  accepts_nested_attributes_for :questions, allow_destroy: true
end
