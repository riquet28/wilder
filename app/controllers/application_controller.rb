class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Membres en ligne
  before_filter :update_user_ping!
  before_filter :count_online_users

  
  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  # Membres en ligne
  def update_user_ping!
    if current_user
      current_user.update(last_ping_at: DateTime.now.in_time_zone)
    end
  end

  # Membres en ligne
  def count_online_users
    @online_users = User.online.count
  end

end
