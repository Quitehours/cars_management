# frozen_string_literal: true

module Views
  class BaseTable
    def initialize(options)
      @options = options
    end

    def rows
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def title
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def separator
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def call
      Terminal::Table.new do |table|
        table.title = title
        table.rows = rows
        table.align_column(0, :center)
        table.style = { width: 100, padding_left: 3, border_x: '=', border_i: 'x', all_separators: separator }
      end
    end
  end
end
