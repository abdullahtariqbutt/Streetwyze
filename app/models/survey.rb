class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  # reject_if: proc { |attr| attr['field'].blank? },

  validate :one_survey_per_user

  def one_survey_per_user
     if user.survey && user.survey != self
       errors.add(:user, "already has a survey")
     end
  end
end
