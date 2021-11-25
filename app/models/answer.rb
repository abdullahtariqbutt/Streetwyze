class Answer < ApplicationRecord
  belongs_to :survey
  belongs_to :question
  belongs_to :response, optional: true
end
