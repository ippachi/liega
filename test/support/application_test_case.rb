# frozen_string_literal: true

class ApplicationTestCase < Test::Unit::TestCase
  def setup
    @fiber = Fiber.new do
      Liega::Persistence::DB.transaction(rollback: :always, savepoint: true, auto_savepoint: true) do
        Fiber.yield
      end
    end
    @fiber.resume
  end

  def teardown
    @fiber.resume
  end
end
