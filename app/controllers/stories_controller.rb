class StoriesController < ApplicationController
  before_action :find_story, only: %i[show edit update destroy]
  before_action :find_map_asset, only: %i[new create]

  def index
    @stories = Story.order(created_at: :desc)
  end

  def show; end

  def new
    @story = @map_asset.stories.build
  end

  def edit; end

  def create
    @story = @map_asset.stories.build(story_params)
    success = @story.save

    respond_to do |format|
      format.html do
        if success
          redirect_to @story, notice: "Story Saved"
        else
          render :new
        end
      end
      format.js
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: "Story Updated"
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url, notice: "Story Destroyed"
  end

  private

    def find_story
      @story = Story.find(params[:id])
    end

    def find_map_asset
      @map_asset = MapAsset.find(params[:map_asset_id])
    end

    def story_params
      params.require(:story).permit(:name, :address, :category, :rating, :stuff_type, :description, uploads: [])
    end
end
