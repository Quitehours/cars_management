# frozen_string_literal: true

module App
  module Controllers
    class MenuController
      def menu
        App::View::MenuView.new.output_menu_table(options)
        App::View::MenuView.new.handlers_options(options)
      end

      def show_descriptions_menu_options
        App::View::MenuView.new.output_help_option_table(options)
      end

      private

      def options
        App::Models::Menu.new.sort_options_by_ranking
      end
    end
  end
end
