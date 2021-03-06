class MapAssetsController < ApplicationController
  before_action :find_asset, only: %i[show edit update destroy]

  def index
    @map_assets = MapAsset.all

    if params[:search].present?
      filters = (ApplyFiltersService.new(params, current_user).call)
      if filters.present?
        @map_assets = MapAsset.send_chain(filters)
      end
    end

    respond_to do |format|
      format.html
      format.csv { send_data GenerateCsv.call(target: @map_assets), filename: "Assets-#{Date.today}.csv" }
    end
  end

  def show
    @stories = @map_asset.stories
  end

  def new
    @map_asset = MapAsset.new
  end

  def edit; end

  def create
    @map_asset = MapAsset.new(asset_params)
    success = @map_asset.save

    respond_to do |format|
      format.html do 
        if success
          redirect_to @map_asset, notice: "Asset was successfully created."
        else
          render :new
        end
      end
      format.js
    end
  end

  def update
    if @map_asset.update(asset_params)
      redirect_to @map_asset, notice: "Asset was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @map_asset.destroy
    redirect_to map_assets_url, notice: "Asset was Deleted."
  end

  def delete_image
    @upload = ActiveStorage::Blob.find_signed(params[:id])
    @upload.attachments.first.purge

    redirect_to map_assets_path, notice: "Image Deleted"
  end

  private

    def find_asset
      @map_asset = MapAsset.find(params[:id])
    end

    def asset_params
      params.require(:map_asset).permit(:user_id, :name, :address, :category, :rating, :stuff_type, :description, uploads: [])
    end
end
