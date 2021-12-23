# frozen_string_literal: true

module Controllers
  class StaticPageController < BaseController
    def options_description
      menu = context.current_user.nil? ? main_menu : user_menu
      renderer.render_options_description(menu: menu, table: View::Table::HelpTable)
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
