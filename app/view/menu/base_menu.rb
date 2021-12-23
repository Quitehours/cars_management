# frozen_string_literal: true

module View
  module Menu
    class BaseMenu
      attr_reader :options, :context

      def initialize(context)
        @context = context
        @options = self.class.options.map { |option| option.new(context) }
      end

      def handle(input_option)
        @options[input_option - 1].handler
      end

      class << self
        def use_options(*args)
          @options = args
        end

        attr_reader :options
      end
    end
  end
end
