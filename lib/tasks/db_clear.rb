# frozen_string_literal: true

namespace :db do
  desc 'Clear whole database'
  task :clear do
    Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
    puts 'Database is empty!'
  end
end
