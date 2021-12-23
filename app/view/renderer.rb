# frozen_string_literal: true

module View
  class Renderer
    include Singleton

    def render_menu(menu:, table:)
      options = menu.options.select(&:show?)
      puts table.new(options).call
    end

    def render_search_result(cars:, table:)
      puts table.new(cars).call
    end

    def render_searches_statistics(data:, table:)
      puts table.new(data).call
    end

    def render_options_description(menu:, table:)
      options = menu.options.select(&:show?)
      puts table.new(options).call
    end

    def render_errors(errors:, table:)
      puts table.new(errors).call
    end

    def prompt
      gets.chomp
    end

    def show(text:)
      puts text
    end
  end
end
