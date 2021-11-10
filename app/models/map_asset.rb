class MapAsset < ApplicationRecord
  include PgSearch

  has_rich_text :description
  has_many_attached :images

  belongs_to :user
  has_many :stories, dependent: :destroy
  
  validates :name, :address, :category, :stuff_type, presence: true
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  pg_search_scope :search, against: [:name, :address, :category, :rating, :stuff_type],
      using: { tsearch: { prefix: true, dictionary: "english" }  }
end
