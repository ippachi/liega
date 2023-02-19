class SessionsController < ApplicationController
  protect_from_forgery except: [:create]

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
    @current_user_id ||= DeveloperUser.find_or_create_by(id: session[:current_user_info]["uid"]).user_id
  end
end
