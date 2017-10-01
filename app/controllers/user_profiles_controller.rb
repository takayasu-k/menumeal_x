class UserProfilesController < ApplicationController

    def show
    end

    def edit
        @user = User.find_by(id: params[:id])
        @user_profile = UserProfile.find_by(user_id: params[:id])
    end

    def update
        @user_profile = UserProfile.find_by(user_id: params[:id])
        @user_profile.profile = params[:user_profile][:profile]
        @user_profile.birthday = params[:user_profile][:birthday]
        @user_profile.gender = params[:user_profile][:gender]

        @user_profile.save
        redirect_to "/users/#{@user_profile.user_id}"
    end
end
