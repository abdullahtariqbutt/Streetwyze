module ApplicationHelper
  def set_random_user_name()
    length = 10
    subsets = [    
        "!", "#", "$", "%", "&", "*", "-",
        "0", "1", "2", "3", "4", "5", "6",
        "7", "8", "9", "?", "^", "@"
    ]
    c = subsets.sample(length).join
    "username" + c
  end

  STUFFTYPE = ["Good", "Bad", "Fix"].freeze
  CATEGORIES = ["Art", "Education", "Health", "Business", "Enviroment", "Housing", "Child Care", "Food", "Industry", "Safety", "Transportation"].freeze

  def get_categories
    CATEGORIES
  end

  def get_stuff_type
    STUFFTYPE
  end
end
