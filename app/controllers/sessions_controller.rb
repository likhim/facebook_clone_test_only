class SessionsController < ApplicationController
	def new
		render "sessions/new"
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome, #{user.email}!"
			redirect_to statuses_path
		else
			flash[:alert] = "Please log in again"
			render "sessions/new"
		end
	end

	#ensure you destroy session in route.rb
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
