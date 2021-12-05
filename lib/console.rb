# frozen_string_literal: true

module Lib
  module Models
    class Console
      attr_reader :searched_data

      SEARCH_REQUIRMENTS = {
        make: I18n.t('console.sort_parameter_make'),
        model: I18n.t('console.sort_parameter_model'),
        year_from: I18n.t('console.sort_parameter_year_from'),
        year_to: I18n.t('console.sort_parameter_year_to'),
        price_from: I18n.t('console.sort_parameter_price_from'),
        price_to: I18n.t('console.sort_parameter_price_to'),
        sort_type: I18n.t('console.sort_type'),
        sort_direction: I18n.t('console.sort_direction')
      }.freeze

      def initialize
        @searched_data = {}
      end

      def call
        puts App::Controllers::MenuController.new.output_table
        App::Controllers::MenuController.new.call

        # menu_options_output
        # menu_handler
        # puts Views::Table::MenuTable.new(Views::Menu::MENU_OPTIONS).call
        # total_cars = Search::Search.new(@searched_data).call
        # total_quantity = total_cars.length
        # total_requests = Search::Statistics::SameTotalRequests.new(@searched_data).request_quantity
        # output(total_cars, { requests_quantity: total_quantity, total_quantity: total_quantity })
        # Models::Search::SearchStore.save(@searched_data, total_quantity, total_requests)
      end

      private

      def requirements_output(default_requirements: false)
        return SEARCH_REQUIRMENTS.each { |rule, _| @searched_data[rule] = '' } if default_requirements

        puts I18n.t('console.sort_start')

        SEARCH_REQUIRMENTS.each do |rule, requirement|
          puts "#{requirement}:"
          @searched_data[rule] = gets.chomp
        end
      end

      def menu_options_output
        Views::Menu::MENU_OPTIONS.each { |_, option| puts "• #{option}" }
        puts "#{I18n.t('console.enter_option')}:"
      end

      def output(total_cars, statistics)
        puts Views::Table::StatisticsTable.new(statistics).call
        puts Views::Table::CarsTable.new(total_cars).call
      end

      def menu_handler
        case gets.chomp.capitalize
        when Views::Menu::MENU_OPTIONS[:search_car] then requirements_output
        when Views::Menu::MENU_OPTIONS[:search_all] then requirements_output(default_requirements: true)
        when Views::Menu::MENU_OPTIONS[:help] then puts Views::Menu.new.help_options_string
        when Views::Menu::MENU_OPTIONS[:exit] then exit
        end
      end
    end
  end
end
