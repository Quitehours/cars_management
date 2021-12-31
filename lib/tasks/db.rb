# frozen_string_literal: true

namespace :db do
  namespace :cars do
    desc 'Added cars to database'
    task :create, :quantity do |_, args|
      Rake::Task['cars:seed'].invoke

      quantity = args.quantity.nil? ? 1 : args.quantity.to_i
      cars = Helpers::FileManagerHelper.read_from_yaml(file_path: Models::Car::DB_CARS)

      quantity.times do
        cars << Models::Car.new(params).to_h
      end

      Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: cars)

      puts "Added #{quantity} cars to db.yml"
    end

    desc 'Clear whole database'
    task :clear do
      Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
      puts 'Database is empty!'
    end

    task :seed do
      if File.exist?(Models::Car::DB_CARS)
        puts 'Database exist.'
      else
        Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: nil)
        puts 'Database create.'
      end
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
