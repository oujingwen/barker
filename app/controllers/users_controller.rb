class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    puts 'I am at action "new"!'

  end

  def create
    @user = User.new(user_params)
    @user.created_date = Time.now

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def login
    @user = User.new
  end

  def process_login
    respond_to do |format|
      if user = User.authenticate(user_params)
        session[:id] = user.id
        format.html { redirect_to(barks_path) }
      else
        format.html { redirect_to(users_login_path, :notice => 'Invalid login.') }
      end
    end
  end

  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to(users_login_path, :notice => 'Logged out.') }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :fullname, :password)
  end
end
