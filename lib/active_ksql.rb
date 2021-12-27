# frozen_string_literal: true

# require 'active_support'
# require 'active_model'

require_relative 'active_ksql/version'
require_relative 'active_ksql/configuration'
require_relative 'active_ksql/api'

module ActiveKsql
  class Error < StandardError; end

  class << self
    attr_accessor :config

    def configure
      self.config = ActiveKsql::Configuration.new
      yield(config)
    end
  end
end
