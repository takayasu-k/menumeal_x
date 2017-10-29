class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @user_profile = @user.user_profile
    end

    def following
        @title = "フォロー中"
        @user = User.find(params[:id])
        @users = @user.following
        render 'show_follow'
    end

    def followers
        @title = "フォロワー"
        @user = User.find(params[:id])
        @users = @user.followers
        render 'show_follow'
    end

    def eaten
        @title = "食べたメニュー登録中"
        @user = User.find(params[:id]).registering_eaten_menu
        render 'show_registering_eaten_menu'
    end

    def desired
        @title = "食べたいメニュー登録中"
        @user = User.find(params[:id]).registering_desired_menu
        render 'show_registering_desired_menu'
    end
end
