# frozen_string_literal: true

module Controllers
  class UsersController < BaseController
    def create
      @new_user = Models::User.new(params)
      if create_user_validator.valid?
        Services::Stores::UserStore.save(@new_user.to_h)
        context.current_user = @new_user
      else
        renderer.render_table(data: create_user_validator.errors, table: View::Table::ErrorsTable)
      end
    end

    private

    def create_user_validator
      @create_user_validator ||= Validators::UserValidator.new(@new_user)
    end

    def params
      {
        email: renderer.prompt(text: I18n.t('lib.user_info.email')),
        password: renderer.prompt(text: I18n.t('lib.user_info.password'))
      }
    end
  end
end
