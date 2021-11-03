class AssetsController < ApplicationController
  before_action :set_asset, only: %i[ show edit update destroy ]

  def index
    @assets = Asset.all
  end

  def show
  end

  def new
    @asset = Asset.new
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      redirect_to @asset
    else
      render :new
    end
  end

  def update
    if @asset.update(asset_params)
      redirect_to @asset
    else
      render :edit
    end
  end

  def destroy
    @asset.destroy
    redirect_to assets_url
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(:name, :address, :category, :leave_rating, :rating, :stuff_type, :story, :images[])
    end
end
