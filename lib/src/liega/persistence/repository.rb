# frozen_string_literal: true

module Liega
  module Persistence
    class Repository
      class StaleObjectError < StandardError; end

      class << self
        attr_accessor :active_record
      end

      private

      def aggregate_root_attributes(model) = model.attributes.symbolize_keys.except(:lock_version)
      def transaction(&) = ActiveRecord::Base.transaction(&)

      def save_relation(entity, attributes, lock_version)
        relation = self.class.active_record.find_or_initialize_by(code: entity.code)
        relation.transaction do
          relation.assign_attributes(attributes)
          relation.assign_attributes(lock_version:) if lock_version
          relation.save!
          yield(relation) if block_given?
        end
      end
    end
  end
end
