class StoriesController < ApplicationController
  before_action :set_story, only: %i[show edit update destroy]
  before_action :find_map_asset, only: %i[new create destroy]

  def index
    @stories = Story.all
  end

  def show; end

  def new
    @story = @map_asset.stories.new
  end

  def edit; end

  def create
    @story = @map_asset.stories.new(story_params)

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
    @story = @map_asset.stories.find(params[:id])

    @story.destroy
    redirect_to stories_url
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def find_map_asset
      @map_asset = MapAsset.find(params[:map_asset_id])
    end

    def story_params
      params.require(:story).permit(:name, :address, :category, :rating, :stuff_type, :description, images:[])
    end
end
