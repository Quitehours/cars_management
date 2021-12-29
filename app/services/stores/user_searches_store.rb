# frozen_string_literal: true

module Services
  module Stores
    class UserSearchesStoreService
      DB_USER_SEARCHES = ENV.fetch('DB_USER_SEARCHES', 'user_searches.yml')

      class << self
        def save(rules)
          temp_data = collection_of_searches
          current_search = search_to_hash(rules)

          already_exists?(temp_data, rules) ? temp_data = same_search(temp_data, rules) : temp_data.push(current_search)
          Helpers::FileManagerHelper.write_to_yaml(file_path: DB_USER_SEARCHES, data: temp_data)
        end

        private

        def collection_of_searches
          Helpers::FileManagerHelper.read_from_yaml(file_path: DB_USER_SEARCHES)
        end

        def already_exists?(searches, rules)
          searches.any? { |search| search[:search_requirements] == rules }
        end

        def search_to_hash(rules, user)
          {
            search_requirements: rules,
            user: user
          }
        end
      end
    end
  end
end
