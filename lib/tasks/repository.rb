# frozen_string_literal: true

require 'ffaker'

namespace :repository do
  desc 'Added cars to db.yml'
  task :cars_storer, :quantity do |_, args|
    Rake::Task['db_cars:exists?'].invoke

    quantity = quantity_execution(args.quantity)
    cars = Helpers::FileManagerHelper.read_from_yaml(file_path: Models::Car::DB_CARS)

    quantity.times do
      cars << Models::Car.new(params).to_h
    end

    Helpers::FileManagerHelper.write_to_yaml(file_path: Models::Car::DB_CARS, data: cars)

    puts "Added #{quantity} cars to db.yml"
  end

  def params
    {
      'make' => FFaker::Vehicle.make,
      'model' => FFaker::Vehicle.model,
      'year' => FFaker::Vehicle.year.to_i,
      'odometer' => FFaker::Random.rand(999_999),
      'price' => FFaker::Random.rand(99_999),
      'description' => FFaker::Lorem.phrase
    }
  end

  def quantity_execution(quantity)
    quantity.nil? ? 1 : quantity.to_i
  end
end
