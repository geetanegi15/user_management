class AddressesController < ApplicationController

    def new
        @user = User.find(params[:user_id])
        @address = Address.new
    end

    def create
        @user = User.find(params[:user_id])
        @address = @user.addresses.new(address_params)

        if @address.save!
            redirect_to user_path(@user)
        else 
            render json: @address.errors.full_messages
        end 
    end

    def edit
        @user = User.find_by_id(params[:user_id]) 
        @addresses = Address.find_by_user_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        @addresses = @user.addresses.find(params[:id])
        #@addresses = @user.addresses
        #@addresses = Address.find_by_user_id(params[:id])

        if @addresses.update(address_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find_by_id(params[:user_id]) 
        @addresses = Address.find_by_user_id(params[:id])
        @addresses.destroy
        redirect_to user_path(@user)
    end

    private

    def address_params
        params.require(:address).permit(:parmanent_address , :residencial_address, :city, :state, :country, :pin)
    end

end
