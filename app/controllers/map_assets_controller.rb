class MapAssetsController < ApplicationController
  before_action :set_asset, only: %i[ show edit update destroy ]

  def index
    @map_assets = MapAsset.order(created_at: :desc)
  end

  def show
  end

  def new
    @map_asset = MapAsset.new
  end

  def edit
  end

  def create
    @map_asset = MapAsset.new(asset_params)
    respond_to do |format|
      if @map_asset.save
        format.js
        format.html { redirect_to @map_asset }
      else
        format.js
        format.html { render :new }
      end
    end
  end

  def update
    if @map_asset.update(asset_params)
      redirect_to @map_asset
    else
      render :edit
    end
  end

  def destroy
    @map_asset.destroy
    redirect_to map_assets_url
  end

  private
    def set_asset
      @map_asset = MapAsset.find(params[:id])
    end

    def asset_params
      params.require(:map_asset).permit(:name, :address, :category, :leave_rating, :rating, :stuff_type, :story, images:[])
    end
end
