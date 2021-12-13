# frozen_string_literal: true

module Models
  class User
    attr_reader :email, :password

    DB_USERS = ENV.fetch('DB_USERS', 'users.yml')

    def initialize(email:, password:)
      @id = SecureRandom.uuid
      @email = email
      @password = password
    end

    def to_h
      {
        I18n.t('models.user.id') => @id,
        I18n.t('models.user.email') => @email,
        I18n.t('models.user.password') => @password
      }
    end
  end
end
