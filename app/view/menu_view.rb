# frozen_string_literal: true

module View
  class MenuView
    def output_menu_table(options)
      puts View::Table::MenuTable.new(options).call
    end

    def output_help_option_table(options)
      puts View::Table::HelpTable.new(options).call
    end

    def handlers_options(options)
      enter_option_string
      input_option = gets.chomp.to_i

      options.map.with_index(1) do |option, index|
        return option.new.handler if index == input_option
      end

      puts I18n.t('app.view.menu_view.error').red
    end

    private

    def enter_option_string
      puts "#{I18n.t('app.view.menu_view.choice')}: "
    end
  end
end
