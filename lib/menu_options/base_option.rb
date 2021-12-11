# frozen_string_literal: true

module MenuOptions
  class OptionBase
    def name
      raise NotImplementedError, "#{self.class} #{I18n.t('app.models.menu_options.error')} '#{__method__}'"
    end

    def ranking
      raise NotImplementedError, "#{self.class} #{I18n.t('app.models.menu_options.error')} '#{__method__}'"
    end

    def description
      raise NotImplementedError, "#{self.class} #{I18n.t('app.models.menu_options.error')} '#{__method__}'"
    end

    def handler
      raise NotImplementedError, "#{self.class} #{I18n.t('app.models.menu_options.error')} '#{__method__}'"
    end

    class << self
      def ranking(type_menu:)
        options = descendants.select { |option| option.new.ranking[type_menu] }
        options.sort_by { |option| -option.new.ranking[type_menu] }
      end

      private

      def descendants
        ObjectSpace.each_object(::Class).select { |klass| klass < self }
      end
    end
  end
end
