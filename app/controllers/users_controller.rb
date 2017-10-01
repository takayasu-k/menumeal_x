class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @user_profile = @user.user_profile
    end
end
