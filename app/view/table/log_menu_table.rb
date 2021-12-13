# frozen_string_literal: true

module View
  module Table
    class LogMenuTable < BaseTable
      private

      def title
        I18n.t('view.table.log_menu').yellow
      end

      def rows
        @options.map.with_index(1) { |option, index| [index, option.new.name] }
      end

      def separator
        true
      end
    end
  end
end
