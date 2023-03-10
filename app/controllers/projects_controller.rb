# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authorize_user!

  def index
    @projects = current_user.projects.order(:code)
  end

  def show
    @project = current_user.projects.find_by!(code: params[:id])
  end

  def new; end

  def create
    project = Liega::App::CreateProject.new.call(current_user_code, params[:project][:name])
    redirect_to project_path(project.code)
  end

  private

  def authorize_user!
    return if current_user

    session[:fowarding_url] = request.original_url
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find_by(code: session[:current_user_code])
  end
end
