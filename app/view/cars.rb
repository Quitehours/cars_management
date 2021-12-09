# frozen_string_literal: true

module View
  class Cars
    def output_statistics_table(statistics)
      puts View::Table::StatisticsTable.new(statistics).call
    end

    def output_cars_table(total_cars)
      puts View::Table::CarsTable.new(total_cars).call
    end
  end
end
