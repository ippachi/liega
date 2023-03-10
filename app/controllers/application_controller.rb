# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user_code = session[:current_user_code]

  def authorize_user!
    return if current_user

    session[:fowarding_url] = request.original_url
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find_by(code: session[:current_user_code])
  end
end
