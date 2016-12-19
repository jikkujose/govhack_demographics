require 'yaml'
require 'awesome_print'
require_relative './dubai_hackathon.rb'
require 'json'

module DubaiHackathon
  def self.download
    countries =  DubaiHackathon::Members.new
      .list
      .map(&:country)
      .compact

    hist = DubaiHackathon::histogram countries
    DubaiHackathon::write_as_yaml file_name: 'histogram.yml', content: hist
  end

  def self.histogram_hash
    @histogram_hash ||= YAML::load File.open('histogram.yml', 'r') { |f| f.read }
  end

  def self.map_data
    'country_data = ' + histogram_hash
      .map { |k, v| [k, v] }
      .unshift(['Country', 'Participants'])
      .to_s
  end

  def self.write_map_data
    File.open('./docs/data.js', 'w') { |f| f.write map_data }
  end

  def self.write_meta_data
    total = histogram_hash
      .values
      .reduce(:+)

    meta = {
      total: total,
      countries: histogram_hash.count,
      updated_at: Time.now.strftime("%b %d")
    }.to_json

    meta_data = "meta = #{meta}"
    File.open('./docs/meta.js', 'w') { |f| f.write meta_data }
  end

  def self.update
    download
    write_meta_data
    write_map_data
  end
end
