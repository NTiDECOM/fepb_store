class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.where(email: params[:email]).first

	  if user && user.authenticate(params[:password])
	  	session[:user_id] = user.id
	  	flash[:success] = 'Signed in successfully.'
	  	redirect_to root_url
  	else
  		flash.now.alert = 'Invalid e-mail or password.'
  		render :new
		end
	end

	def destroy
    session[:user_id] = nil
    flash[:success] = notice 'Signed out successfully.'
    redirect_to root_url
	end
end
