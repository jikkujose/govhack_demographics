require_relative './country_lookup.rb'

module DubaiHackathon
  class Member
    attr_reader :user_name, :first_name, :last_name
    attr_reader :title, :skype, :phone
    attr_reader :email, :time_zone

    def initialize(
      user_name:,
      first_name:,
      last_name:,
      title:,
      skype:,
      phone:,
      email:,
      time_zone:,
      city:
    )
      @user_name = user_name
      @first_name = first_name
      @last_name = last_name
      @title = title
      @skype = skype
      @phone = phone
      @email = email
      @time_zone = time_zone
      @city = city
    end

    def full_name
      @first_name + " " + @last_name
    end

    def city
      return nil if @city.nil?

      @city
        .split(/\//)
        .last
        .gsub(/\_/, ' ')
    end

    def set_country(country)
      @country = country
    end

    def country
      @country ||= CountryLookup.by_city(@city)
    end
  end
end
