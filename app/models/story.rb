class Story < ApplicationRecord
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  belongs_to :map_asset

  validates :name, :address, :category, :stuff_type, presence: true
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  def average_calculate
    if rating.present?
      average = Average.new(map_asset)
      map_asset.update(rating: average.rating_avg)
    end
  end

end
