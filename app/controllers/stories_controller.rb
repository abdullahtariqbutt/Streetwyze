class StoriesController < ApplicationController
  before_action :find_story, only: %i[show edit update destroy]
  before_action :find_map_asset, only: %i[new create]

  def index
    @stories = Story.all

    if params[:search].present?
      @stories = Story.send_chain(ApplyFiltersService.new(params).call)
    end

    respond_to do |format|
      format.html
      format.csv { send_data GenerateCsv.call(target: @stories), filename: "Stories-#{Date.today}.csv" }
    end
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
    success = @story.update(story_params)

    respond_to do |format|
      format.html do
        if success
          redirect_to @story, notice: "Story Updated"
        else
          render :edit
        end
      end
      format.js
    end
  end

  def destroy
    @story.destroy
    redirect_to @story.map_asset, notice: "Story Deleted"
  end

  def delete_image
    @upload = ActiveStorage::Blob.find_signed(params[:id])
    @upload.attachments.first.purge

    redirect_to map_assets_path, notice: "Image Deleted"
  end

  private

  def find_story
    @story = Story.find(params[:id])
  end

  def find_map_asset
    @map_asset = MapAsset.find(params[:map_asset_id])
  end

  def story_params
    params.require(:story).permit(:user_id, :name, :address, :category, :rating, :stuff_type, :description, uploads: [])
  end
end
