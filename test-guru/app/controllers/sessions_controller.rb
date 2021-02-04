class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:requested_path) || root_path
    else 
      flash.now[:alert] = 'Are you Guru?'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    render :new
  end
end
