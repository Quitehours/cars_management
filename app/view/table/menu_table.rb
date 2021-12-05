# frozen_string_literal: true

module App
  module View
    module Table
      class MenuTable < BaseTable
        private

        def title
          I18n.t('views.table.menu').yellow
        end

        def rows
          @options.map.with_index(1) { |option, index| [index, option.new.name] }
        end

        def width
          50
        end

        def separator
          true
        end
      end
    end
  end
end
