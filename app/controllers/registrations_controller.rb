class RegistrationsController < ApplicationController
  def new; end

  def create
    developer_user = DeveloperUser.find(session[:current_user_info]["uid"])
    user = Liega::Domain::Model::User.new
    Liega::Persistence::UserRepository.new.save(user)
    developer_user.update!(user_id: user.id)
    session[:current_user_id] = user.id
    redirect_to projects_path
  end
end
