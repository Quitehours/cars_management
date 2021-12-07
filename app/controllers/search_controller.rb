# frozen_string_literal: true

module Controllers
  class SearchController
    attr_reader :search, :statistics, :searched_data

    def search_a_car
      create_search
      create_statistics
      show_statistics
      show_cars
      save
    end

    def search_all_cars
      create_search(default_requirements: true)
      show_cars
    end

    def show_statistics
      View::SearchView.new.output_statistics_table(@statistics)
    end

    def show_cars
      View::SearchView.new.output_cars_table(total_cars)
    end

    def save
      Models::SearchOperations::SearchStore.save(@searched_data, @statistics)
    end

    private

    def create_search(default_requirements: false)
      @search = Models::Search.new(requirements(default_requirements))
    end

    def create_statistics
      @statistics = {
        requests_quantity: total_requests,
        total_quantity: total_cars.length
      }
    end

    def requirements(default_requirements)
      data = View::SearchView.new
      data.requirements_output unless default_requirements
      data.default_requirements_output if default_requirements

      @searched_data = data.searched_data
    end

    def total_cars
      @search.call
    end

    def total_requests
      Models::SearchOperations::Statistics::SameTotalRequests.new(@searched_data).request_quantity
    end
  end
end
