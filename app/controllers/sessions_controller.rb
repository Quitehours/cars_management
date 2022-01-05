# frozen_string_literal: true

module Controllers
  class SessionsController < BaseController
    def create
      user = Repositories::UserRepository.find_by(params)
      if user
        context.current_user = user
      else
        renderer.render_table(data: [I18n.t('errors.user_not_exists')], table: View::Table::ErrorsTable)
      end
    end

    def destroy
      renderer.render_plain(text: I18n.t('controllers.auth.log_out', email: context.current_user.email))
      context.current_user = nil
    end

    private

    def params
      {
        email: renderer.prompt(text: I18n.t('lib.user_info.email')),
        password: renderer.prompt(text: I18n.t('lib.user_info.password'))
      }
    end
  end
end
