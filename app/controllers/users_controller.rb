class UsersController < ApplicationController

    def sign_out
        reset_session
        redirect_to root_path
    end
end
