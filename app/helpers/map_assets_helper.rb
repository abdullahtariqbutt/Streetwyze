module MapAssetsHelper
  def add_scopes(params)

    filters =[]

    if params[:search].has_key?(:media)
      if params[:search][:media] == "No Media"
        filters << [:no_media]
      elsif params[:search][:media] == "With Media"
        filters << [:with_media]
      else
        filters << [:get_all]
      end
    end

    if params[:search].has_key?(:author)
      if params[:search][:author] == "Only Me"
        filters << [:owner_record, current_user]
      else
        filters << [:all]
      end
    end

    if params[:search].has_key?(:date)
      start_date, end_date = params[:search][:date].split(' - ')
      filters << [:having_dob_between, start_date, end_date]
    end

    if params[:search].has_key?(:keyword)
      if !params[:search][:keyword].to_s.empty?
        filters << [:search_keyword, params[:search][:keyword]]
      end
    end

    if params[:search].has_key?(:category)
      filters << [:category_filter, params[:search][:category]]
    end

    if params[:search].has_key?(:type)
      filters << [:type_filter, params[:search][:type]]
    end

    return filters
  end
end
