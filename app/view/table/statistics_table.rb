# frozen_string_literal: true

module View
  module Table
    class StatisticsTable < BaseTable
      private

      def title
        I18n.t('view.table.statistics.statistics').yellow
      end

      def rows
        [
          [I18n.t('view.table.statistics.total_quantity').cyan, @options[:total_quantity]],
          [I18n.t('view.table.statistics.requests_quantity').cyan, @options[:requests_quantity]]
        ]
      end

      def separator
        false
      end
    end
  end
end
