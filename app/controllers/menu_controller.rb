# frozen_string_literal: true

module Controllers
  class MenuController
    def menu
      View::MenuView.new.output_menu_table(options)
      View::MenuView.new.handlers_options(options)
    end

    def show_descriptions_menu_options
      View::MenuView.new.output_help_option_table(options)
    end

    private

    def options
      Models::Menu.new.sort_options_by_ranking
    end
  end
end
