# frozen_string_literal: true

module Controllers
  class BaseController
    def initialize(context, params = {})
      @context = context
      @params = params
    end

    protected

    def renderer
      View::Renderer.instance
    end

    private

    attr_reader :context, :params
  end
end
