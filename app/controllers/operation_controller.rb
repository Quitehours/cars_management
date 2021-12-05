# frozen_string_literal: true

module App
  module Controllers
    class OperationController
      def create_search(search_requirements)
        @search = Models::Search::Search.new(search_requirements)
      end
  
      def filtration_by_search_requirements; end
  
      class << self
        def save_search; end
      end
    end
  end
end
