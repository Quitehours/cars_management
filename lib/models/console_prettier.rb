# frozen_string_literal: true

class ConsolePrettier
  INCREMENT_INDEX = 1

  def statistics_table(statistics)
    rows = rows_statistics(statistics)
    title = I18n.t('console_prettier.statistic').yellow

    table(rows: rows, title: title, separator: false)
  end

  def cars_table(collection_cars)
    rows = []
    collection_cars.each_with_index { |car, index| rows.push(rows_cars(index, car)) }
    title = I18n.t('console_prettier.results').yellow

    table(rows: rows, title: title, separator: true)
  end

  private

  def rows_cars(index, car)
    value = (index + INCREMENT_INDEX).to_s.cyan
    [value, car_params_doc(car)]
  end

  def car_params_doc(car)
    <<-CAR_PARAMS
    #{I18n.t('console_prettier.id').cyan}: #{car['id']}
    #{I18n.t('console_prettier.make').cyan}: #{car['make']}
    #{I18n.t('console_prettier.model').cyan}: #{car['model']}
    #{I18n.t('console_prettier.year').cyan}: #{car['year']}
    #{I18n.t('console_prettier.odometer').cyan}: #{car['odometer']}
    #{I18n.t('console_prettier.price').cyan}: #{car['price']}
    #{I18n.t('console_prettier.description').cyan}: #{car['description']}
    #{I18n.t('console_prettier.date_added').cyan}: #{car['date_added'].strftime(Car::DEFAULT_TYPE_DATE)}
    CAR_PARAMS
  end

  def rows_statistics(statistics)
    [
      [I18n.t('console_prettier.total_quantity').cyan, statistics[:total_quantity]],
      [I18n.t('console_prettier.request_quantity').cyan, statistics[:request_quantity]]
    ]
  end

  def table(rows:, title:, separator:)
    Terminal::Table.new do |table|
      table.title = title
      table.rows = rows
      table.align_column(0, :center)
      table.style = { width: 100, padding_left: 3, border_x: '=', border_i: 'x', all_separators: separator }
    end
  end
end
