class ProjectCreated < ApplicationJob
  queue_as :default

  def perform(args)
    Liega::App::CreateProject.new.project_created(**args)
  end
end
