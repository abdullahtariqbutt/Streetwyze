module MapAssetsHelper
  def add_scopes(params)

    filters =[]

    if params[:search].has_key?(:dob)
      start_date, end_date = params[:search][:dob].split(' - ')
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

  end
end
