# frozen_string_literal: true

namespace :db_cars do
  desc 'Clear whole database'
  task :clear do
    Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
    puts 'Database is empty!'
  end

  task :exists? do
    if File.exist?('data.yml')
      puts 'Database exist.'
    else
      Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
      puts 'Database create.'
    end
  end
end
