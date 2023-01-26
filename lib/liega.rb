# frozen_string_literal: true

Bundler.require(:default)

loader = Zeitwerk::Loader.for_gem
loader.setup

module Liega
end

loader.eager_load
