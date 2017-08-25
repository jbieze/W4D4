class SessionsController < ApplicationController
  before_action :require_no_user!#, only: [:create, :new]

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
      login_user!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

end
