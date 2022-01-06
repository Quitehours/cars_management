# frozen_string_literal: true

module Repositories
  class CarRepository < BaseRepository
    class << self
      private

      def path_to_db
        ENV.fetch('DB_CARS', './db/db.yml')
      end
    end
  end
end
