class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :response #, optional: true
  belongs_to :option
end
