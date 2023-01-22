module Liega::Domain::Model
  class Project

    private attr_reader :name, :leader_id

    def initialize(name:, leader_id:)
      @name = name
      @leader_id = leader_id
    end

    def to_h
      { name:, leader_id: }
    end
  end
end
