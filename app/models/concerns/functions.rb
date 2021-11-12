module Functions
  extend ActiveSupport::Concern

  included do
    def self.send_chain(methods)
      methods.inject(self) { |result, method| result.send(*method) }
    end

    # Code to remove tags from rich text body
    def descriptionn
      self.description.body.html_safe
    end

    def self.to_csv
      attributes = %i{name address category rating stuff_type descriptionn}

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |map_asset|
          csv << attributes.map{ |attr| map_asset.send(attr) }
        end
      end
    end
  end
end
