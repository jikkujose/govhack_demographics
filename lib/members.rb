require "slack"
require_relative './member.rb'

module DubaiHackathon
  class Members
    attr_reader :client

    def initialize
      @client = Slack::Client.new token: ENV['TOKEN']
    end

    def list
      data
        .each { |m| m.set_country(city_country_lookup_table[m.city]) }
    end

    def search_by_id(regex)
      list
        .select { |m| m.user_name.match regex }
    end

    def data
      @data ||= @client
        .users_list["members"]
        .map do |member_data|
        Member.new(
          user_name: member_data["name"],
          first_name: member_data["profile"]["first_name"],
          last_name: member_data["profile"]["last_name"],
          title: member_data["profile"]["title"],
          skype: member_data["profile"]["skype"],
          phone: member_data["profile"]["phone"],
          email: member_data["profile"]["email"],
          time_zone: member_data["tz_label"],
          city: member_data["tz"]
        )
      end
    end

    def city_country_lookup_table
      @city_country_lookup_table ||= data
        .map { |member| member.city }
        .compact
        .sort
        .uniq
        .inject({}) { |a, city| a[city] = CountryLookup.by_city(city); a }
    end
  end
end
