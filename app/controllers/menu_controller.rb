# frozen_string_literal: true

module Controllers
  class MenuController
    def index
      View::Menu.new.output_menu_table(options)
      handler_menu_options
    end

    def handler_menu_options
      View::Menu.new.output_enter_option_string
      input_option = gets.chomp.to_i
      View::Menu.new.handlers_options(options, input_option)
    end

    private

    def options
      MenuOptions::OptionBase.descendants.sort_by { |option| -option.new.ranking }
    end
  end
end
