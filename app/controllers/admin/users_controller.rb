#encoding: utf-8

module Admin
  class UsersController < Admin::BaseController

    def index
      respond_with @users = User.all
    end

    def show
      respond_with user
    end
    
    def update
        user.update_attributes(params[:user])
        respond_with user, :location => admin_users_path
    end
      
    def destroy
        user.destroy
        respond_with user, :location => admin_users_path
    end

    # Current User (new or from DB)
    # @return [User] user instance
    def user
      @user ||= build_resource(User)
    end

  end
end