class Story < ApplicationRecord

  include PgSearch::Model
  include DescriptionAttribute
  include Scopeable
  include Validatable

  # Associations
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  belongs_to :map_asset

  after_commit :calculate_average

  def calculate_average
    return if rating.blank?

    map_asset.update_attribute(:rating, AverageCalculateService.new(map_asset).call)
  end

end
