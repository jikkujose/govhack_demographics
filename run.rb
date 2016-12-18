require 'yaml'
require 'awesome_print'
require_relative './dubai_hackathon.rb'

countries =  DubaiHackathon::Members.new
  .list
  .map(&:country)
  .compact

histogram = DubaiHackathon::histogram countries

DubaiHackathon::write_as_yaml file_name: 'histogram.yml', content: histogram
