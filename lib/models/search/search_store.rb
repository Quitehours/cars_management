# frozen_string_literal: true

class SearchStore
  DB_SEARCHES = ENV.fetch('DB_SEARCHES', 'search.yml')

  class << self
    def save(search_requirements, total_quantity, request_quantity)
      temp_data = collection_of_searches
      current_search = search_to_hash(search_requirements, total_quantity, request_quantity)

      if already_exists?(temp_data, search_requirements)
        temp_data = update_searches(temp_data, search_requirements)
      else
        temp_data.push(current_search)
      end

      FileManager.write_to_yaml(file_path: DB_SEARCHES, data: temp_data)
    end

    private

    def update_searches(searches, search_requirements)
      searches.each do |search|
        search[:statistics][:request_quantity] += 1 if search[:search_requirements] == search_requirements
      end
    end

    def search_to_hash(search_requirements, total_quantity, request_quantity)
      {
        search_requirements: search_requirements,
        statistics:
        {
          total_quantity: total_quantity,
          request_quantity: request_quantity
        }
      }
    end

    def collection_of_searches
      FileManager.read_from_yaml(file_path: DB_SEARCHES)
    end

    def already_exists?(searches, search_requirements)
      searches.any? { |search| search[:search_requirements] == search_requirements }
    end
  end
end
