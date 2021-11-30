require 'csv'

class CreateFile

  include Interactor

  def call    
    target = context.target

    attributes = %i{name address category rating stuff_type remove_divs}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      target.all.each do |asset|
        csv << attributes.map { |attr| asset.send(attr) }
      end
    end
  end

end
