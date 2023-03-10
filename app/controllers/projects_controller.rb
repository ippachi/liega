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
end
