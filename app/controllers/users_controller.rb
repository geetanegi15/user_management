class UsersController < ApplicationController
    
    def index
        @users = User.all
    end

    def show
        #byebug
        @user = User.find(params[:id])
        #@addresses = @user.addresses
    end

    def new
        #byebug
        @user = User.new
        #@address = @user.address.build
    end

    def create
        #byebug
        @user = User.new(user_params)

        if @user.save
            redirect_to new_user_address_path(@user)
            #redirect_to user_path(@user)
        else 
            render json: @user.error
        end
        
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @destroy_user = User.find(params[:id])
        @destroy_user.destroy
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :mobile_no, :mail_id, :DOB, :activated)
    end
end
