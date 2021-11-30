require 'csv'

class GenerateResponseCsv
  include Interactor

  def call    
    target = context.target

    attributes = []

    target.questions.each do |question|
      attributes << question.content
    end

    CSV.generate(headers: true) do |csv|
      csv << attributes

      target.responses.each do |response|
        csv << target.questions.map{ |question|

          if question.question_type == 'multiple_choice'
            response.answers.find_by(question_id: question.id).option.content
          else
            response.answers.find_by(question_id: question.id).content
          end

         }
      end
    end
  end

end
