# frozen_string_literal: true

module Views
  class Menu
    MENU_OPTIONS =
      [
        I18n.t('views.menu.search_a_car'),
        I18n.t('views.menu.search_all_cars'),
        I18n.t('views.menu.help'),
        I18n.t('views.menu.exit')
      ].freeze

    def help_options_string
      <<~HELP_OPTIONS

        #{'x' * 100}

        Options:
          1. Search a car - starting a search with requirments of the rules. Returns a list of filtered cars.
          2. Search all cars - Returns a list all cars.
          3. Help - instructions for using the application.
          4. Exit - close application.

        #{'x' * 100}

      HELP_OPTIONS
    end
  end
end
