module Api
class UsersController < ApplicationController
    def index
        @users = User.all
        
        render json: (@users)
    end

    def show
        @user =  User.find_by(id: params[:id])

        render json: @user
    end

    def create 
        @user = User.new(activity_params)

        if @user.save
            render json: @user
        else
            render json: {error: @user.errors.messages}, status: 422
        end
    end

    def destroy 
        @user = User.find_by(id: params[:id])

        if @user.destroy
            header :no_content
        else
            render json: {error: @user.errors.messages}, status: 422
        end
    end

    private

    def users_params
        params.require(:activity).permit(:username, :email)
    end
end
end
