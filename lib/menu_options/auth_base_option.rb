# frozen_string_literal: true

module MenuOptions
  class AuthBaseOption < BaseOption
    USER_INFO =
      {
        email: I18n.t('lib.user_info.email'),
        password: I18n.t('lib.user_info.password')
      }.freeze

    private

    def ask_user_info
      user_info = {}
      puts I18n.t('lib.user_info.enter_params')
      USER_INFO.map do |param, requirement|
        puts "#{requirement}: "
        user_info[param] = gets.chomp
      end

      user_info
    end
  end
end
