# frozen_string_literal: true

module App
  module View
    class MenuView
      def handlers_options(options)
        choose_option_output
        input_option = gets.chomp.to_i

        options.map.with_index(1) do |option, index|
          return option.new.handler if index == input_option
        end

        raise StandardError, I18n.t('app.view.menu_view.error')
      end

      private

      def choose_option_output
        puts "#{I18n.t('app.view.menu_view.choice')}: "
      end
    end
  end
end
