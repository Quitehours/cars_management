# frozen_string_literal: true

module Controllers
  class AuthenticationController < BaseController
    def index(action:, credentials: nil)
      @errors = []
      result = action == :log_out ? send(action) : send(action, credentials)
      return renderer.render_errors(errors: @errors, table: View::Table::ErrorsTable) if @errors.any?

      renderer.show(text: result)
    end

    private

    def log_out
      user = context.current_user
      context.current_user = nil

      "#{I18n.t('controllers.auth.log_out')}, #{user[:email]}!"
    end

    def sign_up(credentials)
      @errors << I18n.t('controllers.auth.user_exist') if already_exists?(credentials: credentials, only_email: true)
      Services::UserValidatorService.new(credentials).call.each { |error| @errors << error }
      return nil if @errors.any?

      user = Models::User.new(credentials).to_h
      Services::Stores::UserStoreService.save(user)
      context.current_user = user

      "#{I18n.t('controllers.auth.user_auth')}, #{user[:email]}!"
    end

    def log_in(credentials)
      @errors << I18n.t('errors.user_not_exists') unless already_exists?(credentials: credentials)
      return nil if @errors.any?

      user = Models::User.find_one(credentials: credentials)
      context.current_user = user

      "#{I18n.t('controllers.auth.user_auth')}, #{user[:email]}!"
    end

    def already_exists?(credentials:, only_email: false)
      Models::User.find_one(credentials: credentials, only_email: only_email) ? true : false
    end
  end
end
