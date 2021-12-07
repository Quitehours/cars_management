# frozen_string_literal: true

module App
  module Models
    module Car
      class Car
        attr_reader :make, :model, :year, :odometer, :price, :description, :date_added

        DB_CARS = ENV.fetch('DB_CARS', 'db.yml')
        DEFAULT_TYPE_DATE = '%d/%m/%y'

        def initialize(make:, model:, year:, odometer:, price:, description: '')
          @id = SecureRandom.uuid
          @make = make
          @model = model
          @year = year
          @odometer = odometer
          @price = price
          @description = description
          @date_added = Time.new.strftime(DEFAULT_TYPE_DATE)
        end

        def to_h
          {
            I18n.t('app.models.car.id') => @id,
            I18n.t('app.models.car.make') => @make,
            I18n.t('app.models.car.model') => @model,
            I18n.t('app.models.car.year') => @year,
            I18n.t('app.models.car.odometer') => @odometer,
            I18n.t('app.models.car.price') => @price,
            I18n.t('app.models.car.description') => @description,
            I18n.t('app.models.car.date_added') => @date_added
          }
        end
      end
    end
  end
end