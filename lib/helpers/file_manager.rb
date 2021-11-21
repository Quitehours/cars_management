# frozen_string_literal: true

class FileManager
  WHITELIST_CLASSES = [Symbol, Time, Console, CarStorer, Car, Search, Statistics].freeze

  class << self
    def write_to_yaml(file_path:, data:)
      File.write(file_path, data.to_yaml)
    end

    def read_from_yaml(file_path:)
      binding.pry
      File.new(file_path, 'w') unless File.exist?(file_path)
      YAML.safe_load(File.read(file_path), WHITELIST_CLASSES, [], true) || []
    end
  end
end
