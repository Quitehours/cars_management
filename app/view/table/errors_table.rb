# frozen_string_literal: true

module View
  module Table
    class ErrorsTable < BaseTable
      private

      def title
        I18n.t('view.table.errors').red
      end

      def rows
        @options.map { |option| [option.red] }
      end

      def separator
        true
      end
    end
  end
end
