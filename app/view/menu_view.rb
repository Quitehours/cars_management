# frozen_string_literal: true

module App
  module View
    class MenuView
      def output_menu_table(options)
        puts App::View::Table::MenuTable.new(options).call
      end

      def output_help_option_table(options)
        puts App::View::Table::HelpTable.new(options).call
      end

      def handlers_options(options)
        enter_option_string
        input_option = gets.chomp.to_i

        begin
          options.map.with_index(1) do |option, index|
            return option.new.handler if index == input_option
          end
        rescue StandardError # TODO: add handler exceptions for invalid menu options
          raise StandardError, I18n.t('app.view.menu_view.error')
        end
      end

      private

      def enter_option_string
        puts "#{I18n.t('app.view.menu_view.choice')}: "
      end
    end
  end
end
