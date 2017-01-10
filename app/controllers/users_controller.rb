class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(to_param)
		if @user.save
			flash[:notice] = "Account created. Please log in now."
			redirect_to user_path(@user.id)
		else
			flash[:alert] = "Error creating account: #{params[:email]}"
			render "users/new"
		end
	end

	def edit
	end

	def update
		@user = User.find(params[:id])
		if @user.update(to_param)
			flash[:notice] = "Account is updated successfully."
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "Account is deleted"
		redirect_to statuses_path
	end

	private
	def to_param
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
