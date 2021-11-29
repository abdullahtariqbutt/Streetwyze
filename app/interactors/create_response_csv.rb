class CreateResponseCsv

  include Interactor

  def call    
    target = context.target
    response = context.response

    # ============================================================================
    attributes = %w[Questions]
    response.each do |rspons|
      attributes << ("Response by (" + (rspons.user.user_name).to_s + ")")
    end

    symbols_columns = %i[]
     attributes.each do |atrbute|
      symbols_columns << atrbute.parameterize.underscore.to_sym
    end


    CSV.generate(headers: true) do |csv|

      # Addding attributes to the csv file
      csv << symbols_columns

      byebug

      target.all.each do |answer|

        csv << [answer.question.content,

          if answer.question.question_type == "multiple_choice"
            answer.question.options.each do |o|
              o.content
            end
          else
            answer.content
          end
        ]
      end
    end

  end

end
