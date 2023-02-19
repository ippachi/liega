# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authorize_user!

  def index; end

  def new; end

  private

  def authorize_user!
    return if User.find_by(id: session[:current_user_id])

    session[:fowarding_url] = request.original_url
    redirect_to root_path
  end
end
