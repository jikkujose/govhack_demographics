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
end
