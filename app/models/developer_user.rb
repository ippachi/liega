# frozen_string_literal: true

class DeveloperUser < ApplicationRecord
  belongs_to :user, optional: true
end
