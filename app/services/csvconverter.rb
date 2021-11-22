class Csvconverter

  def initialize(attributes, target)
  	@attributes = attributes
  	@target = target
  end

  def convert_to_csv
    CSV.generate(headers: true) do |csv|
	  csv << @attributes

	  @target.all.each do |asset|
	    csv << @attributes.map{ |attr| asset.send(attr) }
	  end
	end
  end

end
