# frozen_string_literal: true

module View
  module Table
    class CarsTable < BaseTable
      private

      def title
        I18n.t('view.table.cars.results').yellow
      end

      def rows
        @options.map.with_index(1) { |car, index| [index.to_s.cyan, car_params_string(car)] }
      end

      def separator
        true
      end

      def car_params_string(car)
        <<~CAR_PARAMS
          #{I18n.t('models.car.id').cyan}: #{car['id']}
          #{I18n.t('models.car.make').cyan}: #{car['make']}
          #{I18n.t('models.car.model').cyan}: #{car['model']}
          #{I18n.t('models.car.year').cyan}: #{car['year']}
          #{I18n.t('models.car.odometer').cyan}: #{car['odometer']}
          #{I18n.t('models.car.price').cyan}: #{car['price']}
          #{I18n.t('models.car.description').cyan}: #{car['description']}
          #{I18n.t('models.car.date_added').cyan}: #{car['date_added'].strftime(Models::Car::DEFAULT_TYPE_DATE)}
        CAR_PARAMS
      end
    end
  end
end
