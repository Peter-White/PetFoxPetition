class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name , :image, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :image, :email, :password, :password_confirmation, :current_password)
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :email
  end
end
