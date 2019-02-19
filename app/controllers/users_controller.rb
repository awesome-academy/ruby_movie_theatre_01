class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :logged_in_user, only: %i(show edit update)
  before_action :correct_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      store_location
      flash[:success] = t "signup_success"
      redirect_to root_path
    else
      flash.now[:danger] = t "signup_fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      flash[:danger] = t ".edit_fail"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
          .permit User::SIGNUP_PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]
    
    return if @user
    flash[:danger] = t ".notice_show"
    redirect_to signup_path
  end

  def logged_in_user
    return false if logged_in?
    store_location
    flash[:danger] = t ".please_login"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless @user.current_user? current_user
  end

  def admin_user
    redirect_to root_url unless current_user.isAdmin?
  end
end
