class MapAsset < ApplicationRecord

  include PgSearch::Model
  include Scopes
  include Validatons
  include Functions

  # Associations
  has_rich_text :description
  has_many_attached :images
  belongs_to :user
  has_many :stories, dependent: :destroy

end
