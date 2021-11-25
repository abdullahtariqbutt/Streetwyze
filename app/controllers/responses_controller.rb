class ResponsesController < ApplicationController
  before_action :find_survey, only: %i[new create]

  def index
    @responses = Response.all
  end

  def show; end

  def new
    @response = @survey.responses.build
    @questions = @survey.questions
  end

  def create
    @response = @survey.responses.build(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: "Survey was successfully created." }
      else
        format.html { render :new}
      end
    end
  end

  private

    def find_survey
      @survey = Survey.find(params[:survey_id])
    end

    def response_params
      params.require(:response).permit(:user_id, survey_attributes: [:id, questions_attributes: [:id, answers_attributes: [:id]]] )
    end
end
