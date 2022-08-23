class CheckoutController < ApplicationController
  def new
  end

  def create
    
    # product = Product.find(params[:id])
    @product = Product.where(id: params[:product_id]).first
  
       @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [
          name: @product.name,
          price: @product.price,
          currency: "usd",
          quantity: 1
        ],
        mode: 'payment',
        success_url: 'http://localhost:3000',
        cancel_url: 'http://localhost:3000/',
      })

      respond_to do |format|
        format.js 
      end

  end
end
