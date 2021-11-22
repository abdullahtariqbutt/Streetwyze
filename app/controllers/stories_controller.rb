class StoriesController < ApplicationController
  before_action :find_story, only: %i[show edit update destroy]
  before_action :find_map_asset, only: %i[new create]

  def index
    if params[:search].present?
      records = Records.new(params)
      filtered_query = records.get_query

      if filtered_query.empty?
        @stories = Story.order(created_at: :desc)
      else
        @stories = Story.send_chain(filtered_query).order(created_at: :desc)
      end
    else
      @stories = Story.order(created_at: :desc)
    end

    respond_to do |format|
      format.html
      format.csv { send_data @stories.to_csv, filename: "Stories-#{Date.today}.csv" }
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
