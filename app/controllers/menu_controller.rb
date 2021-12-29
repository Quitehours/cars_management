# frozen_string_literal: true

module Controllers
  class MenuController < BaseController
    def index
      renderer.render_table(data: main_menu.options, table: View::Table::MenuTable)
      renderer.render_plain(text: I18n.t('view.menu.choice'))

      main_menu.handle(renderer.prompt.to_i)
    end

    private

    def main_menu
      @main_menu ||= View::Menu::MainMenu.new(context)
    end
  end
end
