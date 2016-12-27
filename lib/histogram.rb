require 'yaml'
require_relative './members.rb'

module DubaiHackathon
  def self.histogram(list)
    list
      .inject({}) do |h, country|
      h[country] ||= 0
      h[country] += 1
      h
    end
  end

  def self.adjust_for_canada(histogram)
    us = histogram['United States']
    canada = us / 10

    histogram['United States'] = us - canada
    histogram['Canada'] = canada
    histogram
  end
end
