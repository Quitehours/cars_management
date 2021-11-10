# frozen_string_literal: true

class Car
  attr_accessor :make, :model, :year, :odometer, :price, :description, :date_added

  DEFAULT_YEAR = 0
  DEFAULT_PRICE = 0

  def initialize(args = {})
    @id = SecureRandom.uuid
    @make = args.fetch(:make, '')
    @model = args.fetch(:model, '')
    @year = args.fetch(:year, DEFAULT_YEAR)
    @odometer = args.fetch(:odometer, '')
    @price = args.fetch(:price, DEFAULT_PRICE)
    @description = args.fetch(:description, '')
    @date_added = Time.new.strftime('%d/%m/%Y')
  end

  def to_s
    puts "Id: #{@id}\n" \
         "Make: #{@make}\n" \
         "Model: #{model}\n" \
         "Year: #{year}\n" \
         "Odometer: #{@odometer}\n" \
         "Price: #{@price}\n" \
         "Description: #{@description}\n" \
         "Date added: #{@date_added}\n"
    puts '-' * 25
  end
end
