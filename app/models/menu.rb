# frozen_string_literal: true

module App
  module Models
    class Menu
      def sort_options_by_ranking
        App::Models::MenuOptions::OptionBase.descendants.sort_by { |option| -option.new.ranking }
      end
    end
  end
end
