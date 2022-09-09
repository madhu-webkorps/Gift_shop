class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
   
    # before_action :authenticate_user!
    protect_from_forgery with: :exception
    # before_action :initialize_session
    # before_action :load_cart
   
    def after_sign_in_path_for(resource)
      if current_user.role == 'admin'
        admin_index_path
      else
        root_path
      end
    end
  
    private

      def initialize_session
        session[:cart] ||= [] # empty cart = empty array
      end
      
      def load_cart
        # @cart = Product.find(session[:cart])
        # Product.all.pluck(:id) => 1, 2
        # Product.find(1, 2, 3) => error
        # Product.where(id: [1, 2, 3]) => 1, 2
        @cart = Product.where(id: session[:cart])
      end
  
    protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) do |user|
              user.permit(:email,:email, :password, :last_name, :pin_code,:address,:phone_no,:frist_name,:image)
          end
        end
end


