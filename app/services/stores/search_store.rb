# frozen_string_literal: true

module Services
  module Stores
    class SearchStore
      DB_SEARCHES = ENV.fetch('DB_SEARCHES', './db/search.yml')

      class << self
        def save(rules, statistics)
          temp_data = collection_of_searches
          current_search = search_to_hash(rules, statistics)

          already_exists?(temp_data, rules) ? temp_data = same_search(temp_data, rules) : temp_data.push(current_search)
          Helpers::FileManagerHelper.write_to_yaml(file_path: DB_SEARCHES, data: temp_data)
        end

        private

        def same_search(searches, rules)
          searches.each do |search|
            search[:statistics][:requests_quantity] += 1 if search[:search_requirements] == rules
          end
        end

        def collection_of_searches
          Helpers::FileManagerHelper.read_from_yaml(file_path: DB_SEARCHES)
        end

        def already_exists?(searches, rules)
          searches.any? { |search| search[:search_requirements] == rules }
        end

        def search_to_hash(rules, statistics)
          {
            search_requirements: rules,
            statistics: statistics
          }
        end
      end
    end
  end
end
