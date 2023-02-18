class ProjectsController < ApplicationController
  before_action :authorize_user!

  def index; end

  private

  def authorize_user!
    head :unauthorized unless User.find_by(id: session[:current_user_id])
  end
end
