# frozen_string_literal: true

module Controllers
  class MenuController < BaseController
    def index
      menu = context.current_user.nil? ? main_menu : user_menu

      renderer.render_menu(menu: menu, table: View::Table::MenuTable)
      renderer.show(text: I18n.t('view.menu.choice'))

      menu.handle(renderer.prompt.to_i)
    end

    private

    def main_menu
      @main_menu ||= View::Menu::MainMenu.new(context)
    end

    def user_menu
      @user_menu ||= View::Menu::UserMenu.new(context)
    end
  end
end
