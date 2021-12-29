# frozen_string_literal: true

module View
  class Renderer
    include Singleton

    def render_table(data:, table:)
      puts table.new(data).call
    end

    def render_plain(text:)
      puts text
    end

    def prompt(text: nil)
      render_plain(text: text) if text
      gets.chomp
    end
  end
end
