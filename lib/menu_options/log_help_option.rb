# frozen_string_literal: true

module MenuOptions
  class LogHelpOption < MainHelpOption
    def ranking
      { log_menu: 0 }
    end

    def handler
      Controllers::StaticPageController.new.show_options_description(:log_menu)
    end
  end
end
