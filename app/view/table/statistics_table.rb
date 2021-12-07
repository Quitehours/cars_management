# frozen_string_literal: true

module App
  module View
    module Table
      class StatisticsTable < BaseTable
        private

        def title
          I18n.t('app.view.table.statistics.statistics').yellow
        end

        def rows
          [
            [I18n.t('app.view.table.statistics.total_quantity').cyan, @options[:total_quantity]],
            [I18n.t('app.view.table.statistics.request_quantity').cyan, @options[:requests_quantity]]
          ]
        end

        def separator
          false
        end
      end
    end
  end
end
