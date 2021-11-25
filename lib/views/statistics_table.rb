# frozen_string_literal: true

module Views
  class StatisticsTable < BaseTable
    private

    def title
      I18n.t('console_prettier.statistics').yellow
    end

    def rows
      [
        [I18n.t('models.statistics.total_quantity').cyan, @options[:total_quantity]],
        [I18n.t('models.statistics.request_quantity').cyan, @options[:requests_quantity]]
      ]
    end

    def separator
      false
    end
  end
end
