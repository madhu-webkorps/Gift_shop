class OrdersController < ApplicationController

    def index
        @orders = Order.all
        # @product = Product.where(:id order_params[:user])
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def new
        @order = Order.new
      end

      def create
        @order = Order.new(order_params)
        @current_cart.cart_products.each do |item|
          @order.cart_product << item
          item.cart_id = nil
        end
        @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to root_path
      end
      
      private
        def order_params
          params.require(:order).permit(:user_id,  :pay_method, :address , :total_price)
        end
end
