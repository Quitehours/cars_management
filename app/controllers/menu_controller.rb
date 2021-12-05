# frozen_string_literal: true

module App
  module Controllers
    class MenuController
      def output_table
        App::View::Table::MenuTable.new(options).call
      end

      def call
        App::View::MenuView.new.handlers_options(options)
      end

      def output_description_options
        App::View::Table::HelpTable.new(options).call
      end

      private

      def options
        App::Models::Menu.new.sort_options_by_ranking
      end
    end
  end
end
