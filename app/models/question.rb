class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type:{ open_ended: 0, multiple_choice: 1, smiley_based: 2 }

  def self.question_type_select
    # titleze makes it a title with capital first letter
    question_types.keys.map { |k| [k.titleize, k] }
  end
end
