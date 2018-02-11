class SessionsController < ApplicationController
  def new
    redirect_to admin_path if logged_in?
  end

  def create
  	admin = Admin.find_by(email: params[:session][:email].downcase)
  	if admin && admin.authenticate(params[:session][:password])
  	  log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
  	  redirect_to admin_path
  	else
  	  flash[:danger] = 'Invalid email/password combination'
  	  render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
