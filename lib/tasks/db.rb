# frozen_string_literal: true

namespace :db do
  namespace :cars do
    desc 'Create database'
    task :create do
      if File.exist?(Models::Car::DB_CARS)
        puts 'Database exist.'
      else
        Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
        puts 'Database create.'
      end
    end

    desc 'Clear whole database'
    task :clear do
      Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
      puts 'Database is empty!'
    end

    desc 'Add cars to database'
    task :seed, :quantity do |_, args|
      quantity = args.quantity.nil? ? 1 : args.quantity.to_i
      cars = Helpers::FileManagerHelper.read_from_yaml(file_path: Models::Car::DB_CARS)

      quantity.times do
        cars << Models::Car.new(car_params).to_h
      end

      Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: cars)

      puts "Added #{quantity} cars to database"
    end

    def car_params
      {
        'make' => FFaker::Vehicle.make,
        'model' => FFaker::Vehicle.model,
        'year' => FFaker::Vehicle.year.to_i,
        'odometer' => FFaker::Random.rand(999_999),
        'price' => FFaker::Random.rand(99_999),
        'description' => FFaker::Lorem.phrase
      }
    end
  end
end
