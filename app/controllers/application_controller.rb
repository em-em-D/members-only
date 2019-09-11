# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  include PostHelper
  include SessionsHelper
  include UserHelper
  helper_method :signed_in?
  helper_method :sign_out
  helper_method :signed_in

  def sign_in(user)
    if user
      session[:user_id] = user.id
      current_user
    else
      redirect_to login_path
    end
  end

end
