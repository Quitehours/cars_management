# frozen_string_literal: true

module Repositories
  class SearchRepository < BaseRepository
    class << self
      def save(search_requirements, statistics_params, current_user)
        user = current_user.nil? ? nil : current_user.email

        if search_exists?(search_requirements, user)
          same_search_iterator(search_requirements, user)
        else
          all.push(search_params(search_requirements, statistics_params, user))
        end

        Helpers::FileManagerHelper.write_to_yaml(file_path: path_to_db, data: all)
      end

      def find_by_key(key:, params:)
        all.find { |search| search[key].slice(*params.keys) == params }
      end

      private

      def path_to_db
        ENV.fetch('DB_SEARCHES', './db/search.yml')
      end

      def same_search_iterator(rules, user)
        all.each do |search|
          search[:statistics][:requests_quantity] += 1 if search[:search_requirements] == rules && search[:user] == user
        end
      end

      def search_exists?(rules, user)
        all.any? { |search| search[:search_requirements] == rules && search[:user] == user }
      end

      def search_params(rules, statistics, user)
        {
          search_requirements: rules,
          statistics: statistics,
          user: user
        }
      end
    end
  end
end
