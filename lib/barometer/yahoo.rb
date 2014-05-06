require 'barometer'
require_relative 'yahoo/version'
require_relative 'yahoo/api'
require_relative 'yahoo/response'

module Barometer
  class Yahoo
    def self.call(query, config={})
      Yahoo.new(query).measure!
    end

    def initialize(query)
      @query = query
    end

    def measure!
      api = Yahoo::Api.new(query)
      Yahoo::Response.new.parse(api.get)
    end

    private

    attr_reader :query
  end
end

Barometer::WeatherService.register(:yahoo, Barometer::Yahoo)
