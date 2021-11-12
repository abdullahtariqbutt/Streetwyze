module Validatons
  extend ActiveSupport::Concern

  included do
    validates :name, :address, :category, :stuff_type, presence: true
    validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
  end
end
