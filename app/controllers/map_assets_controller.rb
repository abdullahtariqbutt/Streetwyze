class MapAssetsController < ApplicationController
  include SharedParams


  before_action :find_asset, only: %i[show edit update destroy]

  def index
    if params[:search].present?
      filter_scopes = add_scopes(params)
      if filter_scopes.empty?
        @map_assets = MapAsset.order(created_at: :desc)
      else
        @map_assets = MapAsset.send_chain(filter_scopes).order(created_at: :desc)
      end
    else
      @map_assets = MapAsset.order(created_at: :desc)
    end
  end

  def show
    @stories = @map_asset.stories.order(created_at: :desc)
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
    redirect_to map_assets_url, notice: "Asset was destroyed."
  end

  def delete_image
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_to map_assets_path, notice: "Image Destroyed"
  end

  private

    def find_asset
      @map_asset = MapAsset.find(params[:id])
    end

    def asset_params
      params.require(:map_asset).permit(:user_id, :name, :address, :category, :rating, :stuff_type, :description, uploads: [])
    end
end
