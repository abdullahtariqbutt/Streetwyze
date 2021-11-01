module ApplicationHelper
  def set_random_user_name()
    length = 10
    complexity = 4
    subsets = [
      [ 
        "!", "#", "$", "%", "&", "*", "-",
        "0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "?", "^", "@"
      ]
    ]
    chars = subsets[0..complexity].flatten
    c = chars.sample(length).join
    "username" + c
  end
end
