class MapAsset < ApplicationRecord
  include PgSearch::Model

  def self.send_chain(methods)
    methods.inject(self) { |result, method| result.send(*method) }
  end

  has_rich_text :description
  has_many_attached :images

  belongs_to :user
  has_many :stories, dependent: :destroy

  validates :name, :address, :category, :stuff_type, presence: true
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  # Defining Scopes 
  scope :category_filter, ->(category) { where("category = ?", category) }
  scope :type_filter, ->(type) { where("stuff_type = ?", type) }
  scope :get_all, -> { all }
  scope :me_author, ->(current_user) { where("user_id = ?", current_user) }
  scope :having_dob_between, ->(start_date, end_date) { where("created_at < ?", start_date..end_date) }

  scope :with_media, -> { where("stuff_type = ?", type) }
  scope :no_media, -> { where("stuff_type = ?", type) }
  
  pg_search_scope :search_keyword, against: [:name, :address, :category, :rating, :stuff_type],
      using: { tsearch: { prefix: true, dictionary: "english" }  }
end
