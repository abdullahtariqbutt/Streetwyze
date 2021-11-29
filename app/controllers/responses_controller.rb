class ResponsesController < ApplicationController
  require 'csv'

  before_action :find_survey, only: %i[new create]

  def index
    @survey = Survey.includes(:questions, responses: {answers: [:question, :option]}).find(params[:survey_id])

    respond_to do |format|
      format.html
      format.csv { send_data GenerateResponseCsv.call(target: @survey), filename: "Resonses-#{Date.today}.csv" }
    end
  end

  def show_msg
    if params.has_key?(:choice)
      if params[:choice].downcase == "yes"
        @survey = Survey.first
        redirect_to new_survey_response_path(@survey)
      else
        redirect_to root_path
      end
    end
  end

  def new
    @response = @survey.responses.build
    @questions = @survey.questions
  end

  def create
    @response = @survey.responses.build(response_params)
    @response.user = current_user

    respond_to do |format|
      if @response.save
        format.html { redirect_to root_path, notice: "Thank you for your response" }
      else
        format.html { render :new }
      end
    end
  end

  private

    def find_survey
      @survey = Survey.find(params[:survey_id])
    end

    def response_params
      params.require(:response).permit(answers_attributes: [:id, :question_id, :option_id, :content] )
    end
end
