class UsersController < ApplicationController
  #action new to create a new User class instance in sign up page
  def new
    @user = User.new
  end

  #action create to fetch user's info from the OSU API, and redirect to login in page if succeed
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to trestle_path
    else
      render 'new'
    end
  end

  #the parameters that will be read from webpage to the user creation
  def user_params

    params.require(:user).permit(:email, :dotName, :password, :password_confirmation)

  end
  
end
