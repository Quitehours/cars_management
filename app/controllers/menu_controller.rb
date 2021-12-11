# frozen_string_literal: true

module Controllers
  class MenuController
    def index
      View::Menu.new.output_menu_table(options_main_menu)
      handler_menu_options
    end

    def handler_menu_options
      View::Menu.new.output_enter_option_string
      input_option = gets.chomp.to_i
      View::Menu.new.handlers_options(options_main_menu, input_option)
    end

    private

    def options_main_menu
      MenuOptions::OptionBase.ranking(type_menu: :main_menu)
    end
  end
end
