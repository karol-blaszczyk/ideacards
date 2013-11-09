#encoding: utf-8

# Base controller for admin module
# Any admin related stuff should inherit from this controller
module Admin
  class BaseController < ApplicationController

    layout 'admin'
    # Whole admin zone should be accessible only for administrators
    before_filter :only_for_admins

    private

    # Raises 404 error if user is not an admin
    def only_for_admins
      raise ActiveRecord::RecordNotFound unless current_user.has_role? :admin
    end

  end
end
