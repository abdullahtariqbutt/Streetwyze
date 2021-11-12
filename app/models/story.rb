class Story < ApplicationRecord

  include PgSearch::Model
  include Scopes
  include Validatons
  include Functions

  # Associations
  has_rich_text :description
  has_many_attached :images
  belongs_to :user
  belongs_to :map_asset

end
