# frozen_string_literal: true

module Services
  class UserValidatorService
    EMAIL_REGEX = /^[a-z\d]+((?:[.]?)[a-z\d]+|[a-z\d]+(?:[.]?))[a-z\d]@[a-z\d]+[.][a-z]+(?:[.]?[a-z]+)?$/
    PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&]{2,})[A-Za-z\d@$!%*?&]{8,20}$/

    def initialize(credentials)
      @credentials = credentials.slice(:email, :password)
      @errors = []
    end

    def call
      @errors << I18n.t('errors.invalid_email') unless EMAIL_REGEX.match?(@credentials[:email])
      @errors << I18n.t('errors.invalid_password') unless PASSWORD_REGEX.match?(@credentials[:password])
      @errors
    end
  end
end
