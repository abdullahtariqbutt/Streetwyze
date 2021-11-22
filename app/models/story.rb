class Story < ApplicationRecord

  include PgSearch::Model
  include Scopes
  include Validations
  include Functions

  # Associations
  has_rich_text :description
  has_many_attached :uploads

  belongs_to :user
  belongs_to :map_asset

  after_commit :average_calculate

  def self.send_chain(methods)
    methods.inject(self) { |result, method| result.send(*method) }
  end

  def average_calculate
    if rating.present?
      average = Average.new(map_asset)
      map_asset.update(rating: average.rating_avg)
    end
  end

end
