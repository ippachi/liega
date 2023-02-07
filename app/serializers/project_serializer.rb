# frozen_string_literal: true

class ProjectSerializer < ActiveJob::Serializers::ObjectSerializer
  def serialize?(argument) = argument.is_a?(Liega::Domain::Model::Project)
  def serialize(project) = super(**project.to_h)
  def deserialize(hash) = Liega::Domain::Model::Project.new(**hash.except("_aj_serialized"))
end
