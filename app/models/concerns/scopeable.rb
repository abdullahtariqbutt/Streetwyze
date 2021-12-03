module Scopeable
  extend ActiveSupport::Concern

  included do
    scope :type_filter, ->(type) { where("stuff_type = ?", type) }
    scope :category_filter, ->(category) { where("category = ?", category) }
    scope :owner_record, ->(current_user) { where("user_id = ?", current_user) }
    scope :with_media, -> { joins(:uploads_attachments) }
    scope :no_media, -> { left_joins(:uploads_attachments).where(active_storage_attachments: { id: nil }) }
    scope :having_dob_between, ->(start_date, end_date) { where(created_at: start_date..end_date) }
    scope :created_on_date, ->(date_creation) {where(created_at: date_creation)}

    pg_search_scope :search_keyword, against: [:name, :address, :category, :rating, :stuff_type],
      using: { tsearch: { prefix: true, dictionary: "english" } }

    def self.send_chain(methods)
      methods.inject(self) { |result, method| result.send(*method) }
    end
  end
end
