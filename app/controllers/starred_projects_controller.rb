# frozen_string_literal: true

class StarredProjectsController < ApplicationController
  before_action :authorize_user!

  def update
    starred_project = Liega::App::StarProject.new.call(current_user_code, params[:project_code])
    @starred_project = StarredProject.find_by!(code: starred_project.code)
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.turbo_stream
    end
  end

  def destroy
    @starred_project = StarredProject.joins(:user, :project).find_by!(user: { code: current_user_code },
                                                                      project: { code: params[:project_code] })
    Liega::App::UnstarProject.new.call(current_user_code, params[:project_code])
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.turbo_stream
    end
  end
end
