class MapAsset < ApplicationRecord
  include PgSearch::Model

  def self.send_chain(methods)
    methods.inject(self) { |result, method| result.send(*method) }
  end

  has_rich_text :description
  has_many_attached :images

  belongs_to :user
  has_many :stories, dependent: :destroy
  
  validates :name, :address, :category, :stuff_type, presence: true
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  pg_search_scope :search, against: [:name, :address, :category, :rating, :stuff_type],
      using: { tsearch: { prefix: true, dictionary: "english" }  }

  scope :category_filter, ->(category) { where("category = ?", category) }
  scope :type_filter, ->(type) { where("stuff_type = ?", type) }
  # scope :media_filter, ->(media) { where("category = ?", category) }
  # scope :author_filter, ->(author) { where("category = ?", category) }
end
