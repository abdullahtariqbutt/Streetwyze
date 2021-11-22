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

end
