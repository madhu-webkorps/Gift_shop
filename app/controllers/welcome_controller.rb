class WelcomeController < ApplicationController
  def index
    @product = Product.all
    @category = Category.all
    @user = User.all

  
    
  end
end


def index
  @cart = CartProduct.all  

end

def new
    order = current_user.orders.create_or_find_by(status: "pending")
    cart_product = order.cart_products.new(product_id: params[:product_id], quantity: 1)
    cart_product.save
    redirect_to  cartproducts_path
end