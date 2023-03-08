# frozen_string_literal: true

module Liega
  module Persistence
    class UserRepository < Repository
      self.active_record = User

      def find(id) = Domain::Model::User.new(**aggregate_root_attributes(User.find(id)))

      def save(user, _lock_version = nil)
        User.upsert(user.to_h)
      end
    end
  end
end
