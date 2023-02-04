# frozen_string_literal: true

module Liega
  module Persistence
    class UserRepository
      def find(id) = Domain::Model::User.new(**User.find(id).attributes.symbolize_keys)
    end
  end
end
