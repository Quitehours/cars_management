# frozen_string_literal: true

class Console
  def call
    system(`clear`)
    puts start_app_string
    await_enter_key
    loop do
      Controllers::MenuController.new.index
      await_enter_key
      system(`clear`)
    end
  end

  private

  def await_enter_key
    gets
  end

  def start_app_string
    I18n.t('lib.console.welcome_to_app')
  end
end
