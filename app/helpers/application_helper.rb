module ApplicationHelper
  def set_random_user_name(length = 10)
    subsets = [
      "!", "#", "$", "%", "&", "*", "-",
      "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", "?", "^", "@"
    ]
    c = subsets.sample(length).join
    "username" + c
  end

  def survey_exists
    @survey = Survey.first
  end

  def get_stuff_type
     ["Good", "Bad", "Fix"]
  end

  def get_categories
    ["Art", "Education", "Health", "Business", "Enviroment", "Housing", "Child Care", "Food", "Industry", "Safety", "Transportation"]
  end
end
