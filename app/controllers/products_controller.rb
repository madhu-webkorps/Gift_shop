class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]



  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

    def index
      
        @product = Product.all

        respond_to do |format|
          format.html
          format.pdf do
            pdf = Prawn::Document.new
            send_data pdf.render, filename: 'product.pdf', type: 'application/pdf'
          end
        @product = @product.where(category_id: params[:category_id]) if params[:category_id].present?
        @user = User.all
    end

    def new
        @product = Product.new
        @category = Category.all
    end

    def show
      @product = Product.where(id: params[:id]).first
    end

    def create
        @product = Product.new(product_params)
          
        respond_to do |format|
          if @product.save
            redirect_to  products_path
            # BaseWorkerJob.perform_async(@product.id)
            format.html { redirect_to  products_path , notice: "product was successfully created." }
            format.json { render :show, status: :created, location: @product }
            format.js
           
            # CrudNotificationMailer.create_notification(@product).deliver_now
            # CrudNotificationMailer.welcome(@product, "hii.html","app/views/products/hii.html").deliver
          else
           
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @product.errors, status: :unprocessable_entity }
            format.js
          end
        end
    end

      def update
        respond_to do |format|
          if @product.update(product_params)
            # UpdateWorkerJob.perform_async(@product.id)
    
            format.html { redirect_to product_url(@product), notice: "product was successfully updated." }
            format.json { render :show, status: :ok, location: @product }
            format.js
           
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @product.errors, status: :unprocessable_entity }
            format.js
          end
        end
      end



   def destroy
    @product = Product.where(id: params[:id]).first
      if @product.destroy
          redirect_to products_path
      else
          # rnder destroy page agian
      end
   end

     
  #  private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :price, :description, :status, :category_id ,:image)
      end

      
    end
  end