# frozen_string_literal: true

class Car
  attr_accessor :make, :model, :year, :odometer, :price, :description, :date

  MIN_PRICE = 0
  MIN_YEAR = 0

  def initialize(args = {})
    @id = SecureRandom.uuid
    @make = args.fetch(:make, '')
    @model = args.fetch(:model, '')
    @year = args.fetch(:year, MIN_YEAR)
    @odometer = args.fetch(:odometer, '')
    @price = args.fetch(:price, MIN_PRICE)
    @description = args.fetch(:description, '')
    @date = Time.new.strftime('%d/%m/%Y')
  end

  def to_s
    puts "Id: #{@id}\n" \
         "Make: #{@make}\n" \
         "Model: #{model}\n" \
         "Year: #{year}\n" \
         "Odometer: #{@odometer}\n" \
         "Price: #{@price}\n" \
         "Description: #{@description}\n" \
         "Date added: #{@date}\n"
    puts '-' * 25
  end
end
