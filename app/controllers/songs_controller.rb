class SongsController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@songs = Song.all
  end


  	def create
  		user = User.find(params[:id])
		@songs = Song.create(title:params[:title], artist:params[:artist],count_song: 1)
		if @songs.invalid?
			flash[:errors] = @songs.errors.full_messages
			redirect_to '/songs'
		else
			Favorite.create(user_id: user.id, song_id: Song.last.id, count_fav: 1)
			redirect_to '/songs'
		end
    end 

    def add
    	user = User.find(session[:id])
		Song.find(params[:id]).increment!(:count_song)
		y = Favorite.where(user_id: user.id,song_id:Song.find(params[:id]))
		if y.empty? == false 
			x = Favorite.where(user_id: user.id,song_id:Song.find(params[:id])).first.id
			Favorite.find(x).increment!(:count_fav)
		else
			Favorite.create(user_id: user.id, song_id: Song.find(params[:id]), count_fav:1)
		end
		redirect_to '/songs'
    end

    def show
    	@song = Song.find(params[:id])
		@userfavs = Favorite.select('*').joins(:song).joins(:user).where(song_id:params[:id])
		# @userfavs = @song.users
    end 

end
