# frozen_string_literal: true

class SearchStore
  DB_SEARCHES = ENV.fetch('DB_SEARCHES', 'search.yml')
  ADD_IDENTICAL_REQUEST = 1

  class << self
    def save(current_search)
      temp_data = collection_of_searches

      temp_data = update_request_quantity(temp_data, current_search.to_h) if already_exists?(temp_data,
                                                                                             current_search.to_h)
      temp_data.push(current_search.to_h) unless already_exists?(temp_data, current_search.to_h)

      FileManager.write_to_yaml(file_path: DB_SEARCHES, data: temp_data)
    end

    private

    def collection_of_searches
      FileManager.read_from_yaml(file_path: DB_SEARCHES)
    end

    def update_request_quantity(searches, current_search)
      searches.each do |search|
        next unless search[:search_rules] == current_search[:search_rules] &&
                    search[:sort_rules] == current_search[:sort_rules] &&
                    search[:statistic][:total_quantity] == current_search[:statistic][:total_quantity]

        search[:statistic][:request_quantity] += ADD_IDENTICAL_REQUEST
      end
    end

    def already_exists?(searches, current_search)
      searches.any? do |search|
        search[:search_rules] == current_search[:search_rules] &&
          search[:sort_rules] == current_search[:sort_rules] &&
          search[:statistic][:total_quantity] == current_search[:statistic][:total_quantity]
      end
    end
  end
end
