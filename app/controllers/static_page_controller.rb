# frozen_string_literal: true

module Controllers
  class StaticPageController
    def show_options_description
      View::StaticPage.new.output_options_description(options)
    end

    private

    def options
      MenuOptions::OptionBase.ranking(type_menu: :main_menu)
    end
  end
end
