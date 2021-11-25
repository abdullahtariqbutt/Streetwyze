module DescriptionAttribute
  extend ActiveSupport::Concern

  included do

    def remove_divs
      self.description.body.html_safe
    end

  end
end
