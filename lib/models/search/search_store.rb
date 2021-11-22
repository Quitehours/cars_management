# frozen_string_literal: true

class SearchStore
  DB_SEARCHES = ENV['DB_SEARCH_PATH'] || 'search.yml'
  ADD_IDENTICAL_REQUEST = 1

  class << self
    def save(search_data)
      temp_data = FileManager.read_from_yaml(file_path: DB_SEARCHES)

      temp_data = update_request_quantity(temp_data, search_data) if already_exists?(temp_data, search_data)
      temp_data.push(search_data) unless already_exists?(temp_data, search_data)

      FileManager.write_to_yaml(file_path: DB_SEARCHES, data: temp_data)
    end

    private

    def already_exists?(temp_data, data)
      temp_data.any? do |search|
        search[:search_rules] == data[:search_rules] &&
          search[:sort_rules] == data[:sort_rules] &&
          search[:statistics][:total_quantity] == data[:statistics][:total_quantity]
      end
    end

    def update_request_quantity(temp_data, data)
      temp_data.each do |search|
        if search[:search_rules] == data[:search_rules] && search[:sort_rules] == data[:sort_rules] && search[:statistics][:total_quantity] == data[:statistics][:total_quantity]
          search[:statistics][:request_quantity] += ADD_IDENTICAL_REQUEST
        end
      end
    end
  end
end
