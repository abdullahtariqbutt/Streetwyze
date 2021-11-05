class MapAsset < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

  validates :name, :address, :category, :stuff_type, presence: true
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
end