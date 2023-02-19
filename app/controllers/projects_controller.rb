class ProjectsController < ApplicationController
  before_action :authorize_user!

  def index; end

  private

  def authorize_user!
    redirect_to root_path unless User.find_by(id: session[:current_user_id])
  end
end
