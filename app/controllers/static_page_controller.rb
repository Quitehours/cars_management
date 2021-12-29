# frozen_string_literal: true

module Controllers
  class StaticPageController < BaseController
    def options_description
      renderer.render_table(data: main_menu.options, table: View::Table::HelpTable)
    end

    private

    def main_menu
      @main_menu ||= View::Menu::MainMenu.new(context)
    end
  end
end
