module Attributes
  extend ActiveSupport::Concern

  included do

    def descriptionn
      self.description.body.html_safe
    end

    def self.to_csv
      attributes = %i{name address category rating stuff_type descriptionn}
      csv = Csvconverter.new(attributes, self)
      csv.convert_to_csv
    end
  end
end
