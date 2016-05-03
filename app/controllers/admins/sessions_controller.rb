class Admins::SessionsController < Devise::SessionsController
  layout 'login'
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   # def create
   #   super
   #   redirect_to root_path
   # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
