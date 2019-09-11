module ApplicationHelper
  # frozen_string_literal: true
  def logged_in_user
    return if logged_in_user

    store_location
    flash[:danger] = 'kindly log in'
    redirect_to login_url
  end

  def sign_in(user)
    session[:user_id] = user.id
    current_user
    redirect_to login_path unless sign_in?
  end
end
