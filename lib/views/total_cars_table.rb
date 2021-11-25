# frozen_string_literal: true

module Lib
  module Views
    class TotalCarsTable < BaseTable
      attr_writer :separator

      private

      def title=(value)
        @title = value.yellow
      end

      def rows=(value)
        @rows = value.map.with_index { |car, index| car_row(index, car) }
      end

      def car_row(index, car)
        value = (index + 1).to_s.cyan
        [value, car_params_string(car)]
      end

      def car_params_string(car)
        <<-CAR_PARAMS
        #{I18n.t('models.car.id').cyan}: #{car['id']}
        #{I18n.t('models.car.make').cyan}: #{car['make']}
        #{I18n.t('models.car.model').cyan}: #{car['model']}
        #{I18n.t('models.car.year').cyan}: #{car['year']}
        #{I18n.t('models.car.odometer').cyan}: #{car['odometer']}
        #{I18n.t('models.car.price').cyan}: #{car['price']}
        #{I18n.t('models.car.description').cyan}: #{car['description']}
        #{I18n.t('models.car.date_added').cyan}: #{car['date_added'].strftime(Car::DEFAULT_TYPE_DATE)}
        CAR_PARAMS
      end
    end
  end
end
