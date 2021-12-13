# frozen_string_literal: true

module Controllers
  class MenuController
    def index(token: false)
      hanlder_log_menu unless token
      handler_main_menu if token
    end

    private

    def handler_options(type_menu:)
      View::Menu.new.output_enter_option_string
      input_option = gets.chomp.to_i
      View::Menu.new.handlers_options(options(type_menu), input_option)
    end

    def hanlder_log_menu
      View::Menu.new.output_log_menu_table(options(:log_menu))
      handler_options(type_menu: :log_menu)
    end

    def handler_main_menu
      View::Menu.new.output_main_menu_table(options(:main_menu))
      handler_options(type_menu: :main_menu)
    end

    def options(type_menu)
      MenuOptions::OptionBase.ranking(type_menu: type_menu)
    end
  end
end
