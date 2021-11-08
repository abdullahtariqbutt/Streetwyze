class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy ]

  def index
    @stories = Story.all
  end

  def show
  end

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:name, :address, :category, :rating, :stuff_type, :story)
    end
end
