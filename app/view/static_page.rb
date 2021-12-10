# frozen_string_literal: true

module View
  class StaticPage
    def output_options_description(options)
      puts View::Table::HelpTable.new(options).call
    end
  end
end
