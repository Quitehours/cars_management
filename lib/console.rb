# frozen_string_literal: true

class Console
  def call
    puts start_app_string
    console_assistent
    loop do
      Controllers::MenuController.new.index
      console_assistent
    end
  end

  private

  def console_assistent
    gets
    system `clear`
  end

  def start_app_string
    I18n.t('lib.console.welcome_to_app')
  end
end
