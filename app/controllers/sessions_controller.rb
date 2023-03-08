# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]

  def create
    session[:current_user_info] = request.env["omniauth.auth"]
    if current_user_id
      session[:current_user_id] = current_user_id
      redirect_to session[:fowarding_url] || projects_path
    else
      redirect_to new_registrations_path
    end
  end

  private

  def current_user_id
    @current_user_id ||= DeveloperUser.find_or_create_by(code: session[:current_user_info]["uid"]).user_id
  end
end
