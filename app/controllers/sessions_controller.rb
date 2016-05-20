class SessionsController < ApplicationController
  def new
  end

  def create
  	user=User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id]=user.id
  		redirect_to profile_path, notice: 'Logged In!'
  	else
      redirect_to login_path,  notice: "Wrong 'Email' or 'Password' !"
  	end
  end

  def destroy
  		session[:user_id]=nil
  		redirect_to root_url, notice: 'Logged Out!'
  end
end
