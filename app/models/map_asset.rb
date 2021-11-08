class MapAsset < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

	has_many :stories

	validates :name, :address, :category, :stuff_type, presence: true
	validates :story, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
  
end
