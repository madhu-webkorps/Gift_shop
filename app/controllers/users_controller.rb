class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :authenticate_user!

    # GET /users or /users.json
    def index
     @admin = User.where(role: 1).first
          @users = User.all
      
    end
  
    # GET /users/1 or /users/1.json
    def show
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users or /users.json
    def create
      debugger
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          # BaseWorkerJob.perform_async(@user.id)
          format.html { redirect_to  root_path , notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
          format.js
         
          # CrudNotificationMailer.create_notification(@user).deliver_now
          # CrudNotificationMailer.welcome(@user, "hii.html","app/views/users/hii.html").deliver
        else
         
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
    #  //commit
    # PATCH/PUT /users/1 or /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
  
          # UpdateWorkerJob.perform_async(@user.id)
  
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
          format.js
         
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
  
    # DELETE /users/1 or /users/1.json
    def destroy
      @user = User.find(params[:id])
      # @id = @user.id
   
      # if DeleteWorkerJob.perform_async(@user.id) 
           @user.destroy
      
        respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
      
    end
    
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:frist_name, :last_name, :address, :pin_code, :phone_no ,:role)
      end
 end
  
  
  
  
  