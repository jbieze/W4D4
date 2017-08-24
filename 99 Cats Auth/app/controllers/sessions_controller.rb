class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.
    entials(user_params[:user_name], user_params[:password])

    if user.nil?
      flash.now[:errors] = ['INCORRECT. Please remain where you are, and wait to be arrested by the Cyber Police.']
      render :new
    else
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to cats_url
    end
  end

  # def destroy
  #
  # end

end
