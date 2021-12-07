# frozen_string_literal: true

module Lib
  module Models
    class Console
      def call
        loop do
          start_app_string
          App::Controllers::MenuController.new.menu
          console_assistent
        end
      end

      private

      def console_assistent
        gets
        system `clear`
      end

      def start_app_string; end
    end
  end
end
