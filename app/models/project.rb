# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_members, -> { active }, dependent: :restrict_with_exception, inverse_of: :project
  has_many :project_members_with_inactive, class_name: "ProjectMember", dependent: :restrict_with_exception,
                                           inverse_of: :project
  has_one :leader, lambda {
                     active.where(role: "leader")
                   }, class_name: "ProjectMember", inverse_of: :project, dependent: :restrict_with_exception
  has_one :backlog, dependent: :restrict_with_exception
end
