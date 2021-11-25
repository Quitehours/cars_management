# frozen_string_literal: true

module Lib
  module Views
    class StatisticsTable < BaseTable
      attr_writer :separator

      private

      def title=(value)
        @title = value.yellow
      end

      def rows=(value)
        @rows = statistics_rows(value)
      end

      def statistics_rows(statistics)
        [
          [I18n.t('models.statistics.total_quantity').cyan, statistics[:total_quantity]],
          [I18n.t('models.statistics.request_quantity').cyan, statistics[:requests_quantity]]
        ]
      end
    end
  end
end
