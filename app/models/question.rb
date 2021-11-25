class Question < ApplicationRecord
  belongs_to :survey
  has_many :options
  accepts_nested_attributes_for :options, allow_destroy: true

  enum question_type: { open_ended: 0, multiple_choice: 1, smiley_based: 2 }

  def self.question_type_select
    question_types.keys.map { |k| [k.titleize, k] }
  end
end
