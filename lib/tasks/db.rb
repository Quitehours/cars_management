# frozen_string_literal: true

namespace :db do
  namespace :cars do
    desc 'Create database'
    task :create do
      if File.exist?(Repositories::CarRepository.all)
        puts 'Database exist.'
      else
        Repositories::CarRepository.save(nil)
        puts 'Database create.'
      end
    end

    desc 'Clear whole database'
    task :clear do
      Repositories::CarRepository.save(nil)
      puts 'Database is empty!'
    end

    desc 'Add cars to database'
    task :seed, [:quantity] do
      quantity = ARGV[1].nil? ? 1 : ARGV[1].to_i
      cars = Repositories::CarRepository.all

      quantity.times do
        cars << Models::Car.new(car_params).to_h
      end

      Repositories::CarRepository.save(cars)

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
