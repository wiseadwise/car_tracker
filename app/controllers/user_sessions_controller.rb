class UserSessionsController < ApplicationController

  before_filter :require_user, :only => :destroy
  before_filter :require_no_user, :only => [:new, :create]

  def new 
    @user_session = UserSession.new
  end 

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Login successful!"
      redirect_to :root
    else
      flash[:alert] = "Invalid email or password."
      render :action => :new
    end 
  end 
                        
  def destroy
    current_user_session.destroy
    session[:return_to] = nil 
    flash[:success] = "Logout successful!"
    redirect_to login_url
  end 

end
