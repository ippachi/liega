# frozen_string_literal: true

module Liega
  module Persistence
    class Repository
      class StaleObjectError < StandardError; end

      class << self
        attr_accessor :active_record
      end

      def save(resource, lock_version = nil)
        transaction do
          yield
          if lock_version &&
             self.class.active_record.where(lock_version:).update_all(lock_version: lock_version + 1).zero?
            raise StaleObjectError
          end

          resource
        end
      end

      private

      def aggregate_root_attributes(model) = model.attributes.symbolize_keys.except(:lock_version)
      def transaction(&) = ActiveRecord::Base.transaction(&)
    end
  end
end
