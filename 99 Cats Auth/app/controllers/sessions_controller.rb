class SessionsController < ActionController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:user_name], user_params[:password])

    if user.nil?
      flash.now[:errors] = ['WRONG! nice try, hacker']
      render :new
    else
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  #
  # def destroy
  # end


end
