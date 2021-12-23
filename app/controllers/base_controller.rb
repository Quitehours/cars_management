# frozen_string_literal: true

module Controllers
  class BaseController
    def initialize(context)
      @context = context
    end

    protected

    def renderer
      View::Renderer.instance
    end

    private

    attr_reader :context
  end
end
