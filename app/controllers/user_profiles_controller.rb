class UserProfilesController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @user_profile = UserProfile.find_by(user_id: params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
        @user_profile = UserProfile.find_by(user_id: params[:id])
    end

    def update
        @user_profile = UserProfile.find_by(user_id: params[:id])
        @user_profile.update(user_profile_params)
        redirect_to "/users/#{@user_profile.user_id}"
    end

    private
    
    def user_profile_params
        params.require(:user_profile).permit(:profile, :birthdat, :gender)
    end
end
