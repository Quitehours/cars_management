# frozen_string_literal: true

module View
  module Table
    class MenuTable < BaseTable
      private

      def title
        I18n.t('view.table.menu').yellow
      end

      def rows
        @options.map.with_index(1) { |option, index| [index, option.name] }
      end

      def separator
        true
      end
    end
  end
end
