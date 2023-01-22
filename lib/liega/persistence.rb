module Liega
  module Persistence
    DB = Sequel.connect(ENV.fetch("DATABASE_URL"))
  end
end
