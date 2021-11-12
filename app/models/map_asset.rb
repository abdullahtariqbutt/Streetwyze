class MapAsset < ApplicationRecord

  include PgSearch::Model
  include ScopesAndValidatons

  # Associations
  has_rich_text :description
  has_many_attached :images
  belongs_to :user
  has_many :stories, dependent: :destroy

  def self.send_chain(methods)
    methods.inject(self) { |result, method| result.send(*method) }
  end

end
