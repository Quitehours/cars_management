# frozen_string_literal: true

module Services
  module Stores
    class UserStore
      DB_USERS = ENV.fetch('DB_USERS', 'users.yml')

      def self.save(new_user)
        collection_users = FileManager.read_from_yaml(file_path: DB_USERS)
        collection_cars.push(new_user.to_h) unless already_exists?(collection_users, new_user)

        FileManager.write_to_yaml(file_path: DB_USERS, data: collection_users)
      end

      def already_exists?(users, new_user)
        users.any?(new_user)
      end
    end
  end
end
