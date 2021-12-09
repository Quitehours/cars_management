# frozen_string_literal: true

module View
  class Menu
    def output_menu_table(options)
      puts View::Table::MenuTable.new(options).call
    end

    def output_help_option_table(options)
      puts View::Table::HelpTable.new(options).call
    end

    def handlers_options(options, input_option)
      options.map.with_index(1) do |option, index|
        return option.new.handler if index == input_option
      end

      puts I18n.t('view.menu.error').red
    end

    def output_enter_option_string
      puts "#{I18n.t('view.menu.choice')}: "
    end
  end
end
