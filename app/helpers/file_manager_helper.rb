# frozen_string_literal: true

module Helpers
  class FileManagerHelper
    WHITELIST_CLASSES = [Symbol, Time, Models::Car, Models::User, BCrypt::Password].freeze

    class << self
      def write_to_yaml(file_path:, data:)
        File.write(file_path, data.to_yaml)
      end

      def read_from_yaml(file_path:)
        File.new(file_path, 'w') unless File.exist?(file_path)
        YAML.safe_load(File.read(file_path), WHITELIST_CLASSES, [], true) || []
      end
    end
  end
end
