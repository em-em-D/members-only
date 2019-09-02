module ApplicationHelper
  # frozen_string_literal: true
  def logged_in_user
    return if logged_in_user

    store_location
    flash[:danger] = 'kindly log in'
    redirect_to login_url
  end
end
