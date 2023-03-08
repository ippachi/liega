# frozen_string_literal: true

module Liega
  module Persistence
    class UserRepository < Repository
      self.active_record = User

      def find(code) = Domain::Model::User.new(**aggregate_root_attributes(User.find_by!(code:)))

      def save(user, lock_version = nil)
        save_relation(user, user.to_h, lock_version)
      end
    end
  end
end
