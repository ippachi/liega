# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authorize_user!

  def index
    @q = current_user.projects.ransack(params[:q])
    @projects = @q.result.preload(:starred_members).order(:code)
    @starred_projects = current_user.starred_projects.preload(project: :starred_members).order(:code)
    @is_searching = params.dig(:q, :name_or_code_cont).present?
  end

  def show
    @project = current_user.projects.find_by!(code: params[:id])
  end

  def create
    project = Liega::App::CreateProject.new.call(current_user_code, params[:project][:name])
    redirect_to project_path(project.code)
  end
end
