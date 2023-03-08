# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :redirect_when_authenticated

  def new; end

  def create
    developer_user = DeveloperUser.find_by!(code: session[:current_user_info]["uid"])
    user = Liega::Domain::Model::User.new
    Liega::Persistence::UserRepository.new.save(user)
    developer_user.update!(user: User.find_by!(code: user.code))
    session[:current_user_code] = user.code
    redirect_to projects_path
  end

  private

  def redirect_when_authenticated
    redirect_to projects_path if User.find_by(code: session[:current_user_code])
  end
end
