module Barometer
  class Yahoo
    class Response
      class TimeZone < Barometer::WeatherService::Response::TimeZone
        private

        def time_zone
          payload.using(/ ([A-Z]+)$/).fetch('item', 'pubDate')
        end
      end
    end
  end
end
