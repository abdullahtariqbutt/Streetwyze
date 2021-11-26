class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :option, optional: true
  belongs_to :response
end
