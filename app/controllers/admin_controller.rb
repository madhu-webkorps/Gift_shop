class AdminController < ApplicationController
  def index

    @users = User.all
    # @admin = Admin.all

  end
end
