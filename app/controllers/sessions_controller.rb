class SessionsController < ApplicationController

		def login
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])    #works, but had to restart server first
			session[:id] = user.id
			redirect_to "/songs"
		else
			if user.nil? 
				flash[:login_errors] = "User does not exist"
			    redirect_to "/"
		    end 
		end		
	end
		def logout
		session[:id] = nil
		redirect_to "/"
	end 
end
