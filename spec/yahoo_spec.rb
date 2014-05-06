require_relative 'spec_helper'

module Barometer
  describe Yahoo, vcr: {
    cassette_name: 'Yahoo'
  } do
    it "auto-registers this weather service as :yahoo" do
      Barometer::WeatherService.source(:yahoo).should == Barometer::Yahoo
    end

    describe ".call" do
      let(:converted_query) { Barometer::ConvertedQuery.new('90210', :zipcode, :metric) }
      let(:query) { build_query.tap{|q|q.stub(:convert! => converted_query)} }

      subject { Barometer::Yahoo.call(query) }

      it "asks the query to convert to accepted formats" do
        query.should_receive(:convert!).with(:zipcode, :weather_id, :woe_id)
        subject
      end

      it "includes the expected data" do
        subject.query.should == '90210'
        subject.format.should == :zipcode
        subject.should be_metric

        should have_data(:current, :observed_at).as_format(:time)
        should have_data(:current, :stale_at).as_format(:time)

        should have_data(:current, :humidity).as_format(:float)
        should have_data(:current, :condition).as_format(:string)
        should have_data(:current, :icon).as_format(:number)
        should have_data(:current, :temperature).as_format(:temperature)
        should have_data(:current, :wind_chill).as_format(:temperature)
        should have_data(:current, :wind).as_format(:vector)
        should have_data(:current, :pressure).as_format(:pressure)
        should have_data(:current, :visibility).as_format(:distance)
        should have_data(:current, :sun, :rise).as_format(:time)
        should have_data(:current, :sun, :set).as_format(:time)

        should have_data(:location, :city).as_value("Beverly Hills")
        should have_data(:location, :state_code).as_value("CA")
        should have_data(:location, :country_code).as_value("US")
        should have_data(:location, :latitude).as_value(34.08)
        should have_data(:location, :longitude).as_value(-118.4)

        should have_data(:timezone, :to_s).as_format(/^P[DS]T$/i)

        subject.forecast.size.should == 5
        should have_forecast(:starts_at).as_format(:time)
        should have_forecast(:ends_at).as_format(:time)
        should have_forecast(:icon).as_format(:number)
        should have_forecast(:condition).as_format(:string)
        should have_forecast(:high).as_format(:temperature)
        should have_forecast(:low).as_format(:temperature)
        should have_forecast(:sun, :rise).as_format(:time)
        should have_forecast(:sun, :set).as_format(:time)
      end
    end

  end
end
