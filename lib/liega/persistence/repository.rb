module Liega::Persistence
  class Repository
    def self.relation_name(name = nil)
      @relation_name = name if name
      @relation_name
    end

    def save(aggregate_root) = relation.insert(aggregate_root.to_h)
    def find(id) = relation.first!(id:)

    private

    def relation = DB[self.class.relation_name]
  end
end
