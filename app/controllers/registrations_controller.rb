class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:nom, :prenom, :email, :password, :password_confirmation, :pseudo)
  end

  def account_update_params
    params.require(:user).permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation, :current_password, :avatar)
  end

end