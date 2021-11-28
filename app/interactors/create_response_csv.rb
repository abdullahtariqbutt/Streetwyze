class CreateResponseCsv

  include Interactor

  def call    
    target = context.target
    response = context.response

    # Gathering all attributes
    attributes = ["Questions"]
    response.each do |rspons|
      attributes << ("Response by (" + (rspons.user.user_name).to_s + ") ")
    end
    # End

    success = CSV.generate(headers: true) do |csv|
      # Addding attributes to the csv file
      csv << attributes

      # target.all.each do |answer|

      #   csv << attributes.map { |attr|

      #     answer.question.content.send(attr)

      #     if answer.question.question_type == "open_ended" || answer.question.question_type == "smiley_based"
      #       answer.content.send(attr)

      #     else
      #       answer.question.options.each do |o|
      #         o.content.send(attr)
      #       end

      #     end
      #   }

        # csv << answer.question.content
  
        # if answer.question.question_type == "open_ended" || answer.question.question_type == "smiley_based"
        #     csv << answer.content
        # else
        #   answer.question.options.each do |o|
        #     csv << o.content
        #   end
        # end

      # end
    end

    if success
      context.success = success
    else
      context.fail!(errors: success.errors)
    end
  end

end
