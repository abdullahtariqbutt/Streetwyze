class ApplyFiltersService

  def initialize(parameters, current_user)
    @params = parameters
    @current_user = current_user
  end

  def call
    filters = []
    if @params[:search].has_key?(:category)
      filters << [:category_filter, @params[:search][:category]]
    end

    if @params[:search].has_key?(:type)
      filters << [:type_filter, @params[:search][:type]]
    end

    if @params[:search].has_key?(:media)
      if @params[:search][:media] == "No Media"
        filters << [:no_media]
      elsif @params[:search][:media] == "With Media"
        filters << [:with_media]
      end
    end

    if @params[:search].has_key?(:author)
      if @params[:search][:author] == "Only Me"
        filters << [:owner_record, @current_user]
      end
    end

    if @params[:search].has_key?(:date) && !@params[:search][:date].to_s.empty?
      start_date, end_date = @params[:search][:date].split('-')
      if start_date && end_date
        filters << [:having_dob_between, (start_date.to_date.beginning_of_day), (end_date.to_date.end_of_day)]
      end
    end

    if @params[:search].has_key?(:keyword) && !@params[:search][:keyword].to_s.empty?
      filters << [:search_keyword, @params[:search][:keyword]]
    end

    filters
  end

end
