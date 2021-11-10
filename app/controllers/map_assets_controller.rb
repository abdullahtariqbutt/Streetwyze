class MapAssetsController < ApplicationController
  before_action :set_asset, only: %i[show edit update destroy]

  def index

    filters =[]

    if params[:search].present?

      params[:search].each do |key, value|
        if key == "category"
          filters << [:category_filter, value]
        end
        if key == "type"
          filters << [:type_filter, value]
        end
      end

      if filters.empty?
        @map_assets = MapAsset.order(created_at: :desc)
      else
        @map_assets = MapAsset.send_chain(filters)
      end

    else
      @map_assets = MapAsset.order(created_at: :desc)
      
    end


    # if params[:query].present?
    #   @map_assets = MapAsset.search(params[:query]).order(created_at: :desc)
    # else
    #   @map_assets = MapAsset.order(created_at: :desc)
    # end
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
    respond_to do |format|
      if @map_asset.save
        format.html { redirect_to @map_asset, notice: "Asset was successfully created." }
      else
        format.html { render :new }
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

    def set_asset
      @map_asset = MapAsset.find(params[:id])
    end

    def asset_params
      params.require(:map_asset).permit(:user_id, :name, :address, :category, :rating, :stuff_type, :description, images:[])
    end
end
