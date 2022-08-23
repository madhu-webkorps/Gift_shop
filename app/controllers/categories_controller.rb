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
        format.html { redirect_to categories_path , notice: "category was successfully created." }
        format.json { render :show, status: :created, location: @category }
        format.js
       
        else
          debugger
          if @category.errors.message
            @category.errors.each do |error|
              error.full_message
            end 
          end
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
