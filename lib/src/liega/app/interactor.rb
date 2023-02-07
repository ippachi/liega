# frozen_string_literal: true

module Liega
  module App
    class Interactor
      private

      def transaction(&) = ActiveRecord::Base.transaction(&)
    end
  end
end
