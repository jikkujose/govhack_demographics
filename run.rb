require 'yaml'
require 'awesome_print'
require_relative './dubai_hackathon.rb'
require 'json'

module DubaiHackathon
  def self.update
    countries =  DubaiHackathon::Members.new
      .list
      .map(&:country)
      .compact

    hist = DubaiHackathon::histogram countries
    DubaiHackathon::write_as_yaml file_name: 'histogram.yml', content: hist
  end

  def self.map_data
    hist = YAML::load File.open('histogram.yml', 'r') { |f| f.read }
    'country_data = ' + hist.map { |k, v| [k, v] }.unshift(['Country', 'Participants']).to_s
  end

  def self.rebuild_map
    File.open('./html/data.js', 'w') { |f| f.write map_data }
  end
end

DubaiHackathon::rebuild_map
