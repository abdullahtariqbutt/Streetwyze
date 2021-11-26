class SurveysController < ApplicationController
  before_action :find_user, only: %i[new create]
  before_action :find_survey, only: %i[show edit update destroy]

  def index
    @surveys = Survey.all
  end

  def show; end

  def new
    @survey = @user.build_survey
  end

  def edit; end

  def create
    @survey = @user.build_survey(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: "Survey was successfully created." }
      else
        format.html { render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: "Survey was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "Survey was successfully destroyed." }
    end
  end

  private

    def find_survey
      @survey = Survey.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

    def survey_params
      params.require(:survey).permit(:user_id, :title, :script, questions_attributes:[:id, :content, :question_type, :_destroy, options_attributes:[:id, :content, :_destroy]] )
    end
end
