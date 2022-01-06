# frozen_string_literal: true

module View
  module Menu
    class MainMenu < BaseMenu
      use_options MenuOptions::SearchACarOption,
                  MenuOptions::SearchAllCarsOption,
                  MenuOptions::MySearchesOption,
                  MenuOptions::HelpOption,
                  MenuOptions::SignUpOption,
                  MenuOptions::LogInOption,
                  MenuOptions::LogOutOption,
                  MenuOptions::ExitOption
    end
  end
end
