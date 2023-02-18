class SessionsController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    user_info = request.env["omniauth.auth"]
    session[:current_user_id] = DeveloperUser.find(user_info["uid"]).user_id
    redirect_to projects_path
  end
end
