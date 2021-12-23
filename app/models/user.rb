# frozen_string_literal: true

module Models
  class User
    DB_USERS = ENV.fetch('DB_USERS', 'users.yml')

    def initialize(credentials)
      @email = credentials[:email]
      @password = BCrypt::Password.create(credentials[:password])
    end

    def to_h
      {
        email: email,
        password: password
      }
    end

    class << self
      def create(credentials)
        new_user = new(**credentials.slice(:email, :password))
        Services::Stores::UserStoreService.save(new_user)
      end

      def find_one(credentials:, only_email: false)
        return users.find { |user| user[:email] == credentials[:email] } if only_email

        users.find { |user| user == credentials }
      end

      private

      def users
        @users ||= Helpers::FileManagerHelper.read_from_yaml(file_path: DB_USERS)
      end
    end
  end
end
