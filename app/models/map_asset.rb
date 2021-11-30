class MapAsset < ApplicationRecord

  include PgSearch::Model
  include DescriptionAttribute
  include Scopeable
  include Validatable

  # Associations
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  has_many :stories, dependent: :destroy

end
