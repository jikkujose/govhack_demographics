require 'yaml'

module DubaiHackathon
  def self.write_as_yaml(file_name:, content:)
    File.open(file_name, 'w') { |f| f.write YAML::dump(content) }
  end
end
