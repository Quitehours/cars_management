# frozen_string_literal: true

module Services
  module Stores
    class UserStoreService
      DB_USERS = ENV.fetch('DB_USERS', 'users.yml')

      class << self
        def save(new_user)
          collection_users = Helpers::FileManagerHelper.read_from_yaml(file_path: DB_USERS)
          collection_users.push(new_user.to_h)

          Helpers::FileManagerHelper.write_to_yaml(file_path: DB_USERS, data: collection_users)
        end
      end
    end
  end
end
