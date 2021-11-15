module ApplicationHelper
  def set_random_user_name()
    length = 10
    subsets = [
      
        "!", "#", "$", "%", "&", "*", "-",
        "0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "?", "^", "@"
    ]
    c = subsets.sample(length).join
    "username" + c
  end

  def is_gold_user(id)
    @user = User.find(id)
    if @user.is_premium_user == true
      puts("user is Premium member")
      return true
    else
      puts("user not a Premium member")
      return false
    end
  end
end
