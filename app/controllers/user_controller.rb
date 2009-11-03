require 'cgi'

class UserController < ApplicationController
  def login
    @error = nil
    if request.post?
      if !(params[:email] != '' && params[:password] != '')
        @error = "Please enter you email address and password"
      elsif user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.user_id
        redirect_to '/'
      else
        @error = "There is no user registered with an email of #{CGI.escapeHTML params[:email]}. If you are subscribed to email alerts, you are not necessarily registered on the website. If you register, you will be able to manage your email alerts, as well as leave comments."
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  
  def password
  end
  
  def new
    @user = User.new
  end
  
  def create
  end
end
