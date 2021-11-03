class MapAsset < ApplicationRecord
	has_rich_text :story
	has_many_attached :images
end
