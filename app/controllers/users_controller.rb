class UsersController < ApplicationController

    def home
    end

    def new
        @user = User.new
    end

    def create

    end
end
