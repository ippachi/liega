class StarredProjectsController < ApplicationController
  before_action :authorize_user!

  def update
    Liega::App::StarProject.new.call(current_user_code, params[:project_code])
    redirect_to projects_path
  end
end
