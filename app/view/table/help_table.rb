# frozen_string_literal: true

module App
  module View
    module Table
      class HelpTable < BaseTable
        private

        def title
          I18n.t('app.view.table.help').yellow
        end

        def rows
          @options.map { |option| [option.new.name, option.new.description] }
        end

        def width
          100
        end

        def separator
          true
        end
      end
    end
  end
end
