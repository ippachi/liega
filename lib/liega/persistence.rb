# frozen_string_literal: true

module Liega
  module Persistence
    DB = Sequel.connect(ENV.fetch("DATABASE_URL"))
  end
end
