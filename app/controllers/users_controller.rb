class UsersController < ApplicationController

	def index
		
	end


    
    def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to @user, notice: "Thank you for signing up for Ribbit!"
	    else
           render 'new'
       end

	end 




	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@ribbit = Ribbit.new
	end


	def edit
		
	end

	def destroy
		
	end

	private

	def user_params
           params.require(:user).permit(:avatar_url, :email, :name, :password, :password_confirmation, :username)
    end
end
