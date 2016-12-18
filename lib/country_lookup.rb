require 'yaml'
require 'unirest'
require_relative './constants.rb'

module DubaiHackathon
  class CountryLookup
    def self.raw(city)
      @city = city

      Unirest
        .get(URL[:country_lookup] + @city)
        .body
    end

    def self.by_city(city)
      return local_lookup[city] unless local_lookup[city].nil?
      return nil if city.nil?

      raw(city)
        .first
        .split(/,\s/)
        .last
    end

    def self.local_lookup
      @ll ||= YAML::load File.open('./city_country_lookup_table.yml', 'r').read
    end
  end
end
