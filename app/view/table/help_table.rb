# frozen_string_literal: true

module View
  module Table
    class HelpTable < BaseTable
      private

      def title
        I18n.t('view.table.help').yellow
      end

      def rows
        @options.map { |option| [option.new.name.cyan, option.new.description] }
      end

      def separator
        true
      end
    end
  end
end
