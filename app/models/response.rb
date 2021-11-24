class Response < ApplicationRecord
  belongs_to :survey
  accepts_nested_attributes_for :survey, allow_destroy: true
  # , reject_if: proc { |attr| attr['field'].blank? }
end
