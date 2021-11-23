class Story < ApplicationRecord

  include PgSearch::Model
  include Scopes
  include Validations

  # Associations
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  belongs_to :map_asset

  def self.send_chain(methods)
    methods.inject(self) { |result, method| result.send(*method) }
  end

  validates :name, :address, :category, :stuff_type, presence: true
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  after_commit :average_calculate

  def average_calculate
    if rating.present?
      average = AverageCalculateService.new(map_asset)
      map_asset.update(rating: average.call)
    end
  end

end
