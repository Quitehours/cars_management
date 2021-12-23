# frozen_string_literal: true

module MenuOptions
  class SignUpOption < AuthBaseOption
    def name
      I18n.t('lib.menu_options.name.sign_up')
    end

    def description
      I18n.t('lib.menu_options.description.sign_up')
    end

    def handler
      Controllers::AuthController.new(context).index(action: :sign_up, credentials: ask_user_info)
    end

    def show?
      context.current_user.nil?
    end
  end
end
