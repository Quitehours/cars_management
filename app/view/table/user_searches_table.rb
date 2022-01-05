# frozen_string_literal: true

module View
  module Table
    class UserSearchesTable < BaseTable
      private

      def title
        I18n.t('view.table.user_searches').yellow
      end

      def rows
        @options.map.with_index(1) { |search, index| [index.to_s.cyan, search_to_string(search[:search_requirements])] }
      end

      def separator
        true
      end

      def search_to_string(search)
        <<~SEARCH_PARAMS
          #{I18n.t('view.table.search.make').cyan}: #{search[:make]}
          #{I18n.t('view.table.search.model').cyan}: #{search[:model]}
          #{I18n.t('view.table.search.year_from').cyan}: #{search[:year_from]}
          #{I18n.t('view.table.search.year_to').cyan}: #{search[:year_to]}
          #{I18n.t('view.table.search.price_from').cyan}: #{search[:price_from]}
          #{I18n.t('view.table.search.price_to').cyan}: #{search[:price_to]}
          #{I18n.t('view.table.search.sort_type').cyan}: #{search[:sort_type]}
          #{I18n.t('view.table.search.sort_direction').cyan}: #{search[:sort_direction]}
        SEARCH_PARAMS
      end
    end
  end
end
