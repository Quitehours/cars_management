# frozen_string_literal: true

require 'pry'
require 'yaml'
require 'dotenv/load'
require 'time'
require 'securerandom'
require 'i18n'
require 'terminal-table'
require 'colorize'
require 'colorized_string'
require 'bcrypt'
require 'singleton'

require_relative './config/i18n'

require_relative './lib/menu_options/base_option'
require_relative './lib/menu_options/exit_option'
require_relative './lib/menu_options/help_option'
require_relative './lib/menu_options/search_a_car_option'
require_relative './lib/menu_options/search_all_cars_option'
require_relative './lib/menu_options/log_out_option'
require_relative './lib/menu_options/log_in_option'
require_relative './lib/menu_options/sign_up_option'

require_relative './app/controllers/base_controller'
require_relative './app/controllers/cars_controller'
require_relative './app/controllers/users_controller'
require_relative './app/controllers/sessions_controller'
require_relative './app/controllers/menu_controller'
require_relative './app/controllers/static_page_controller'

require_relative './app/models/car'
require_relative './app/models/user'

require_relative './app/view/table/base_table'
require_relative './app/view/table/cars_table'
require_relative './app/view/table/errors_table'
require_relative './app/view/table/help_table'
require_relative './app/view/table/menu_table'
require_relative './app/view/table/statistics_table'
require_relative './app/view/menu/base_menu'
require_relative './app/view/menu/main_menu'
require_relative './app/view/renderer'

require_relative './app/services/statistics/same_search_request_quantity'
require_relative './app/services/stores/car_store'
require_relative './app/services/stores/user_store'
require_relative './app/services/stores/search_store'
require_relative './app/services/transform_params'

require_relative './app/validators/user_validator'

require_relative './app/queries/find_cars'

require_relative './app/helpers/file_manager_helper'
require_relative './app/helpers/request_context_helper'

require_relative './lib/console'
