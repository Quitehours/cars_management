# frozen_string_literal: true

module View
  module Menu
    class UserMenu < BaseMenu
      use_options MenuOptions::SearchACarOption,
                  MenuOptions::SearchAllCarsOption,
                  MenuOptions::HelpOption,
                  MenuOptions::LogOutOption,
                  MenuOptions::ExitOption
    end
  end
end
