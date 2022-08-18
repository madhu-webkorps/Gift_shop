class WelcomeController < ApplicationController
  def index
    @product = Product.all
    @category = Category.all
    @user = User.all
  end
end
