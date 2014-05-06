# Barometer::Yahoo

[![Build Status](https://travis-ci.org/attack/barometer-yahoo.png?branch=master)](https://travis-ci.org/attack/barometer-yahoo)
[![Gem Version](https://badge.fury.io/rb/barometer-yahoo.png)](http://badge.fury.io/rb/barometer-yahoo)
[![Code Climate](https://codeclimate.com/github/attack/barometer-yahoo.png)](https://codeclimate.com/github/attack/barometer-yahoo)

A wrapper for the Yahoo weather API. This wrapper is
barometer compatiable and can be used with or without barometer.

## Usage

This wrapper was designed to be used via [Barometer](https://github.com/attack/barometer), or on its own.

### Directly

By using this wrapper directly, you lose any Barometer aggregation and
failover capabilities. Barometer is still dependency to provide a
framework for query conversion, weather service integration and data
processing.

```ruby
query = Barometer::Query.new('42.7243,-73.6927')
result = Barometer::Yahoo.call(query)
puts result.current.temperature.c
```

### via Barometer

Barometer is a weather service framework, providing aggregation and failover
capabilities. To make Yahoo available to Barometer, you must register
it as an available weather service.

```ruby
Barometer::WeatherService.register(:yahoo, Barometer::Yahoo)
```

Then follow the instructions provided by [Barometer](https://github.com/attack/barometer).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Links

* repo: http://github.com/attack/barometer-yahoo
* travis ci: https://travis-ci.org/attack/barometer-yahoo
* code climate: https://codeclimate.com/github/attack/barometer-yahoo

## Copyright

Copyright (c) 2009-2014 Mark Gangl. See LICENSE for details.
