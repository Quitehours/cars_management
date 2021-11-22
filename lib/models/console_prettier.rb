# frozen_string_literal: true

class ConsolePrettier
  def statistics_table(statistics)
    rows = rows_statistics(statistics)

    table(rows, I18n.t('console_prettier.statistics'))
  end

  def cars_list_table
  end

  private

  def rows_statistics(statistics)
    [
      [I18n.t('console_prettier.total_quantity'), statistics[:total_quantity]],
      [I18n.t('console_prettier.request_quantity'), statistics[:request_quantity]]
    ]
  end

  def table(rows, title)
    Terminal::Table.new do |table|
      table.title = title
      table.rows = rows
      table.style = { width: 100, padding_left: 3, border_x: '=', border_i: 'x' }
    end
  end
end
