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

    class << self
      def find_by(params)
        user_params = all.find { |user| user.slice(*params.keys) == params }
        new(user_params) if user_params
      end

      private

      def all
        @all ||= Helpers::FileManagerHelper.read_from_yaml(file_path: DB_USERS)
      end
    end
  end
end
