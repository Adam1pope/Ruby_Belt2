class UsersController < ApplicationController
  def index
  end
    def create
  	@user = User.create(user_params)
  	session[:id] = @user.id           

  	if @user.valid? 
  		redirect_to "/songs"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'	
  	end	
  end
  	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def playlist
    	@user = User.find(params[:id])
		@fav = Favorite.select('*').joins(:song).joins(:user).where(user_id:params[:id])
    end
end
