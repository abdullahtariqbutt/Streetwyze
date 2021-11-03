class MapAsset < ApplicationRecord
	has_rich_text :story
	has_many_attached :images

	validates :name, :address, :category, :stuff_type, :story, presence: true
	validates :story, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
end
