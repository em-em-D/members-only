module SessionsHelper
  # frozen_string_literal: true
  def sign_in(user)
    session[:user_id] = user.id
    current_user
  end

  def user(user)
    user.produce_token
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:user_token] = user.user_token
    user.update_token
  end

  # returns user matching the remeber token cookie.

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id) && user
      sign_in user
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    current_user && current_user == user
  end

  # logs out present user
  def sign_out
    cookies.delete(:user_id)
    cookies.delete(:user_token)
    session.delete(:user_id)
  end

  def sign_in?
    !current_user.nil?
  end
end
