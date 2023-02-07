# frozen_string_literal: true

require_relative "../../app/serializers/project_serializer"
Rails.application.config.active_job.custom_serializers << ProjectSerializer
