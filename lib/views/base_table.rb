# frozen_string_literal: true

module Lib
  module Views
    class BaseTable
      def initialize(rows, title, separator)
        self.rows = rows
        self.title = title
        self.separator = separator
      end

      def call
        table
      end

      def rows=(_value)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end

      def title=(_value)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end

      def separator=(_value)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end

      private

      def table
        Terminal::Table.new do |table|
          table.title = @title
          table.rows = @rows
          table.align_column(0, :center)
          table.style = { width: 100, padding_left: 3, border_x: '=', border_i: 'x', all_separators: @separator }
        end
      end
    end
  end
end
