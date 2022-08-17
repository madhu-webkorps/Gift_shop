class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
  @category = Category.new
  end


  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        redirect_to categories_path
        # BaseWorkerJob.perform_async(@category.id)
        format.html { redirect_to categories_path , notice: "category was successfully created." }
        format.json { render :show, status: :created, location: @category }
        format.js
       
        # CrudNotificationMailer.create_notification(@product).deliver_now
        # CrudNotificationMailer.welcome(@product, "hii.html","app/views/products/hii.html").deliver
      else
       
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def show
  end

# Edit method ----------------------------
    def edit 
        @category = Category.where(id: params[:id]).first
        
    end

    def update 
        @category = Category.where(id: params[:id]).first
        
        if @category.update_attributes(category_params)
          debugger
          redirect_to categories_path
        else
            # rnder update page agian
        end
    end

  def destroy
       @category = Category.where(id: params[:id]).first
        if @category.destroy
            redirect_to categories_path
        else
            # rnder destroy page agian
        end
  end

  

  private

    def category_params
      params.require(:category).permit(:name, :status)
    end

end
