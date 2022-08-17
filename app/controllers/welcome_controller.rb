class WelcomeController < ApplicationController
  def index
    @product = Product.all
    @category = Category.all
  end
end
