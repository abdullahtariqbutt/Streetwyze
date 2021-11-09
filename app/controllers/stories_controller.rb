class StoriesController < ApplicationController
  include StoriesHelper

  before_action :set_story, only: %i[show edit update destroy]
  before_action :set_asset, only: %i[new create]

  def index
    @stories = Story.order(created_at: :desc)
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
        if @story.rating.present?
          @map_asset.update(rating: calulate_avg_rating(@map_asset))
        end
        format.html { redirect_to @story, notice: "Story Saved" }
      else
        format.html { render :new }
      end
      # format.js
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

  def delete_image
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_to map_assets_path, notice: "Image Destroyed"
  end

  private

    def set_story
      @story = Story.find(params[:id])
    end

    def set_asset
      @map_asset = MapAsset.find(params[:map_asset_id])
    end

    def story_params
      params.require(:story).permit(:user_id, :name, :address, :category, :rating, :stuff_type, :description, images:[])
    end
end
