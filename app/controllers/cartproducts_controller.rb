class CartproductsController < ApplicationController
  
  before_action :authenticate_user!
    
  def index
        @cart = CartProduct.all  
  end
  
  def new
  end

  def show
  end

  def create
    
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
     
      @cart_product = current_cart.cart_products.find_by(:product_id => chosen_product)
      # Iterate the cart_product's quantity by one
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new
      @cart_product.cart = current_cart
      @cart_product.product = chosen_product
    end
  
    # Save and redirect to cart show path
    @cart_product.save
    redirect_to cart_path(current_cart)
  end
  
  private
    def cart_product_params
      params.require(:cart_product).permit(:quantity,:product_id, :cart_id)
    end
  
end