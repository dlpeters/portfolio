class SessionsController < ApplicationController

  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In"
    else
      flash.now.alert = "Email or password invalid."
      render :new
    end
  end
end
