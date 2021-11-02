# frozen_string_literal: true

class FileManager
  LOAD_SAFE_CLASSES = [Symbol, Time, Car, CarStorer].freeze

  class << self
    def write_to_yaml(path:, data:)
      File.write(path, data.to_yaml)
    end

    def read_from_yaml(file_path:)
      File.new(file_path, 'w') unless File.exist?(file_path)

      YAML.safe_load(File.read(file_path), LOAD_SAFE_CLASSES, [], true) || []
    end
  end
end