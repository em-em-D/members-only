# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase).try(:authenticate, params[:session][:password])
    if user
      sign_in user
      user user
      redirect_to '/postboard'
    else
      flash.now[:notice] = 'invalid credentials'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
