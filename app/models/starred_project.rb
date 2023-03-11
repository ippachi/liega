# frozen_string_literal: true

class StarredProject < ApplicationRecord
  belongs_to :project_member
end
