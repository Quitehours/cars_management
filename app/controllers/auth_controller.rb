# frozen_string_literal: true

module Controllers
  class AuthController < BaseController
    def index(action:, credentials:)
      @errors = []
      context.current_user = sign_up(credentials) if action == :sign_up
      context.current_user = log_in(credentials) if action == :log_in
      return renderer.render_errors(errors: @errors, table: View::Table::ErrorsTable) if @errors.any?

      renderer.show(text: I18n.t('controllers.auth.user_auth') + context.current_user[:email])
    end

    def log_out
      context.current_user = nil
    end

    private

    def sign_up(credentials)
      @errors << I18n.t('errors.user_exists') if already_exists?(credentials: credentials, only_email: true)
      Services::UserValidatorService.new(credentials).call.each { |error| @errors << error }

      Models::User.create(credentials)
      @errors.any? ? nil : Models::User.find_one(credentials: credentials)
    end

    def log_in(credentials)
      @errors << I18n.t('errors.user_not_exists') unless already_exists?(credentials: credentials)
      @errors.any? ? nil : Models::User.find_one(credentials: credentials)
    end

    def already_exists?(credentials:, only_email: false)
      Models::User.find_one(credentials: credentials, only_email: only_email) ? true : false
    end
  end
end
