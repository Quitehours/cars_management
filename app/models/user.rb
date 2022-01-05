# frozen_string_literal: true

module Models
  class User
    DB_USERS = ENV.fetch('DB_USERS', './db/users.yml')

    attr_reader :email, :password, :original_password

    def initialize(params)
      @email = params[:email]
      @original_password = params[:password]
      @password = BCrypt::Password.create(params[:password])
    end

    def to_h
      {
        email: @email,
        password: @password
      }
    end
  end
end
