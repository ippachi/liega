# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authorize_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def new; end

  def create
    project = Liega::App::CreateProject.new.call(current_user_id, params[:project][:name])
    redirect_to project_path(project.id)
  end

  private

  def authorize_user!
    return if current_user

    session[:fowarding_url] = request.original_url
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
end
