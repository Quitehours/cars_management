# frozen_string_literal: true

module Repositories
  class BaseRepository
    class << self
      def save(data)
        all.push(data)
        Helpers::FileManagerHelper.write_to_yaml(file_path: path_to_db, data: all)
      end

      def all
        @all ||= Helpers::FileManagerHelper.read_from_yaml(file_path: path_to_db)
      end

      private

      def path_to_db
        raise NotImplementedError, "#{self.class} #{I18n.t('')} '#{__method__}'"
      end
    end
  end
end
