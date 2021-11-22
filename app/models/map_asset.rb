class MapAsset < ApplicationRecord

  include PgSearch::Model
  include Scopes
  include Validations
  include Functions

  # Associations
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  has_many :stories, dependent: :destroy

end
