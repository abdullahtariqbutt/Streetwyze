class Story < ApplicationRecord

  include PgSearch::Model
  include Attributes
  include Scopeable
  include Validatable

  # Associations
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  belongs_to :map_asset

  after_commit :average_calculate

  def average_calculate
    if rating.present?
      map_asset.update(rating: AverageCalculateService.new(map_asset).call)
    end
  end

end
