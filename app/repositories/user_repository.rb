# frozen_string_literal: true

module Repositories
  class UserRepository < BaseRepository
    class << self
      def find_by(params)
        user_params = all.find { |user| user.slice(*params.keys) == params }
        Models::User.new(user_params) if user_params
      end

      private

      def path_to_db
        ENV.fetch('DB_USERS', './db/users.yml')
      end
    end
  end
end
