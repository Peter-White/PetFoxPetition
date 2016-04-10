class CallbacksController < ApplicationController
    def linkedin
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def gplus
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def tumblr
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
end
