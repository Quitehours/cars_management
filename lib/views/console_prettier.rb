# frozen_string_literal: true

module ConsolePrettier
  class Table
    private

    def table(rows:, title:, separator:)
      Terminal::Table.new do |table|
        table.title = title
        table.rows = rows
        table.align_column(0, :center)
        table.style = { width: 100, padding_left: 3, border_x: '=', border_i: 'x', all_separators: separator }
      end
    end
  end

  class TableStatistic < Table
    def call(total_quantity, requests_quantity)
      rows = rows_statistics(total_quantity, requests_quantity)
      title = I18n.t('console_prettier.statistics').yellow

      table(rows: rows, title: title, separator: false)
    end

    private

    def rows_statistics(total_quantity, requests_quantity)
      [
        [I18n.t('models.statistics.total_quantity').cyan, total_quantity],
        [I18n.t('models.statistics.request_quantity').cyan, requests_quantity]
      ]
    end
  end

  class TableTotalCars < Table
    def call(collection_of_cars)
      rows = []
      collection_of_cars.each_with_index { |car, index| rows.push(rows_cars(index, car)) }
      title = I18n.t('console_prettier.results').yellow

      table(rows: rows, title: title, separator: true)
    end

    private

    def rows_cars(index, car)
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
