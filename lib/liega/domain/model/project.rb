module Liega::Domain::Model
  class Project

    attr_reader :id
    private attr_reader :name, :leader_id

    def initialize(name:, leader_id:)
      @id = ULID.generate
      @name = name
      @leader_id = leader_id
    end

    def to_h = { id:, name:, leader_id: }
  end
end
