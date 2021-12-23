# frozen_string_literal: true

module MenuOptions
  class BaseOption
    def initialize(context)
      @context = context
    end

    def name
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    def description
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    def handler
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    def show?
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    private

    attr_reader :context
  end
end
