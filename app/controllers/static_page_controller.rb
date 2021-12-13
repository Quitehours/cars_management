# frozen_string_literal: true

module Controllers
  class StaticPageController
    def show_options_description(type_menu)
      View::StaticPage.new.output_options_description(options(type_menu))
    end

    private

    def options(type_menu)
      MenuOptions::OptionBase.ranking(type_menu: type_menu)
    end
  end
end
