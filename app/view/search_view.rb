# frozen_string_literal: true

module App
  module View
    class SearchView
      attr_reader :searched_data

      SEARCH_REQUIRMENTS = {
        make: I18n.t('app.view.search_view.sort_parameter_make'),
        model: I18n.t('app.view.search_view.sort_parameter_model'),
        year_from: I18n.t('app.view.search_view.sort_parameter_year_from'),
        year_to: I18n.t('app.view.search_view.sort_parameter_year_to'),
        price_from: I18n.t('app.view.search_view.sort_parameter_price_from'),
        price_to: I18n.t('app.view.search_view.sort_parameter_price_to'),
        sort_type: I18n.t('app.view.search_view.sort_type'),
        sort_direction: I18n.t('app.view.search_view.sort_direction')
      }.freeze

      def initialize
        @searched_data = {}
      end

      def requirements_output
        puts I18n.t('app.view.search_view.enter_option')
        SEARCH_REQUIRMENTS.map do |rule, requirement|
          puts "#{requirement}: "
          @searched_data[rule] = gets.chomp
        end
      end

      def default_requirements_output
        SEARCH_REQUIRMENTS.each do |rule, _|
          @searched_data[rule] = ''
        end
      end

      def output_statistics_table(statistics)
        puts App::View::Table::StatisticsTable.new(statistics).call
      end

      def output_cars_table(total_cars)
        puts App::View::Table::CarsTable.new(total_cars).call
      end
    end
  end
end
