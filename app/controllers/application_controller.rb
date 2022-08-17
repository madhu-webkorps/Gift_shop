class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
   
    def after_sign_in_path_for(resource)
        
        if resource.is_a?(Admin)
            admin_index_path
        else
            root_path 
        end
    end

    
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:email,:email, :password, :last_name, :pin_code,:address,:phone_no,:frist_name,:image)
      end
  end
end

