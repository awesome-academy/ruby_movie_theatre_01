class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase

    if @user&.authenticate params[:session][:password]
      remember_login @user
    else
      flash.now[:danger] = t "invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def remember_login user
    log_in @user
    flash[:success] = t "login_successful"
    rmb = params[:session][:remember_me]
    rmb == Settings.remember_me ? remember(user) : forget(user)
    redirect_back_or user
  end
end
