# frozen_string_literal: true

class Car
  attr_writer :make, :model, :year, :odometer, :price, :description, :date

  def initialize(args = {})
    @id = SecureRandom.uuid
    @make = args.fetch(:make, '')
    @model = args.fetch(:model, '')
    @year = args.fetch(:year, '')
    @odometer = args.fetch(:odometer, '')
    @price = args.fetch(:price, '')
    @description = args.fetch(:description, '')
    @date = Time.new.strftime('%d/%m/%Y')
  end

  def to_s
    
  end
end
