# frozen_string_literal: true

class Console
  def call
    pause_app
    loop do
      console_clear
      Controllers::MenuController.new(context).index
      pause_app
    end
  end

  private

  def console_clear
    system(`clear`)
  end

  def pause_app
    gets
  end

  def context
    @context ||= Helpers::RequestContextHelper.new
  end
end
