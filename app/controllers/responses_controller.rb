class ResponsesController < ApplicationController
  before_action :find_user, only: %i[new create]
  before_action :find_survey, only: %i[new show edit update destroy]

  def index
    @responses = Response.all
  end

  def show; end

  def new
    @response = @survey.build_response
    @questions = @survey.questions
  end

  def edit; end

  def create
    @response = @survey.build_response(response_params)

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
      @survey = Survey.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

    def response_params
      params.require(:response).permit(:user_id, survey_attributes:[:id, questions_attributes:[:id, answers_attributes:[:id]]] )
    end
end
