module Liega::Domain::Model
  class User
    attr_reader :id

    def initialize
      @id = ULID.generate
    end

    def create_project(name:)
      Project.new(name:, leader_id: id)
    end
  end
end
