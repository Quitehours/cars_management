# frozen_string_literal: true

module Validators
  class UserValidator
    EMAIL_REGEX = /^[a-z\d]+((?:[.]?)[a-z\d]+|[a-z\d]+(?:[.]?))[a-z\d]@[a-z\d]+[.][a-z]+(?:[.]?[a-z]+)?$/
    PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&]{2,})[A-Za-z\d@$!%*?&]{8,20}$/

    attr_reader :errors

    def initialize(user)
      @user = user
    end

    def valid?
      @errors = []
      validate
      @errors.empty?
    end

    private

    def validate
      @errors << I18n.t('errors.invalid_email') unless EMAIL_REGEX.match?(@user.email)
      @errors << I18n.t('errors.invalid_password') unless PASSWORD_REGEX.match?(@user.original_password)
    end
  end
end
