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
require 'zeitwerk'

require_relative './config/i18n'

require_relative './lib/console'

require_relative './app/controllers/car_controller'
require_relative './app/controllers/menu_controller'
require_relative './app/controllers/operation_controller'

require_relative './app/models/menu'

require_relative './app/models/car/car_storer'
require_relative './app/models/car/car'

require_relative './app/models/menu_options/option_base'
require_relative './app/models/menu_options/exit_option'
require_relative './app/models/menu_options/help_option'
require_relative './app/models/menu_options/search_a_car_option'
require_relative './app/models/menu_options/search_all_cars_option'

require_relative './app/models/operation/filter_cars'
require_relative './app/models/operation/search_store'
require_relative './app/models/operation/search'
require_relative './app/models/operation/statistics'
require_relative './app/models/operation/transforming_values'

require_relative './app/view/table/base_table'
require_relative './app/view/table/cars_table'
require_relative './app/view/table/menu_table'
require_relative './app/view/table/statistics_table'
require_relative './app/view/table/help_table'
require_relative './app/view/menu_view'

require_relative './db/file_manager'
