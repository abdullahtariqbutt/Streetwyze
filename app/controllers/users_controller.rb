class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    # @user = Friend.new
    @user = current_user.users.build
  end

  def edit
  end

  def create
    # @user = User.new(user_params)
    @user = current_user.users.build(user_params)

    if @user.save
		redirect_to @user
    else
      render :new
    end

  end

  def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
  end

  def destroy
    @user.destroy
    redirect_to friends_url
  end


  def correct_user
    @user = current_user.users.find_by(id: params[:id])
    redirect_to users_path , notice: "Not Authorized to edit this friend" if @users.nil?
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :user_name, :password,:user_id)
    end
end
