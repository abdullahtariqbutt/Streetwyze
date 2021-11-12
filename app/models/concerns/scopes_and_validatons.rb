module ScopesAndValidatons
  extend ActiveSupport::Concern

  included do
    # Scopes
    scope :get_all, -> { all }
    scope :type_filter, ->(type) { where("stuff_type = ?", type) }
    scope :category_filter, ->(category) { where("category = ?", category) }
    scope :owner_record, ->(current_user) { where("user_id = ?", current_user) }
    scope :with_media, -> { joins(:images_attachments) }
    scope :no_media, -> { left_joins(:images_attachments).where(active_storage_attachments: { id: nil }) }
    scope :having_dob_between, ->(start_date, end_date) { where(created_at: start_date..end_date) }

    pg_search_scope :search_keyword, against: [:name, :address, :category, :rating, :stuff_type],
        using: { tsearch: { prefix: true, dictionary: "english" }  }

    # Validations
    validates :name, :address, :category, :stuff_type, presence: true
    validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
  end
end
