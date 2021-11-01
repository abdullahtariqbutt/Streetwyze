class AssestsController < ApplicationController
  before_action :set_assest, only: %i[ show edit update destroy ]

  def index
    @assests = Assest.all
  end

  def show
  end

  def new
    @assest = Assest.new
  end

  def edit
  end

  def create
    @assest = Assest.new(assest_params)

    if @assest.save
      redirect_to @assest
    else
      render :new
    end
  end

  def update
    if @assest.update(assest_params)
      redirect_to @assest
    else
      render :edit
    end
  end

  def destroy
    @assest.destroy
    redirect_to assests_url
  end

  private
    def set_assest
      @assest = Assest.find(params[:id])
    end

    def assest_params
      params.require(:assest).permit(:name, :address, :category, :leave_rating, :rating, :stuff_type, :story)
    end
end
