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

require_relative './config/i18n'

require_relative './lib/models/transforming_values'
require_relative './lib/models/car/car_storer'
require_relative './lib/models/car/car'
require_relative './lib/models/search/search'
require_relative './lib/models/search/search_store'
require_relative './lib/models/search/statistics'
require_relative './lib/models/search/filter_cars'
require_relative './lib/models/console'

require_relative './lib/helpers/file_manager'

require_relative './lib/views/table/base_table'
require_relative './lib/views/table/cars_table'
require_relative './lib/views/table/statistics_table'
require_relative './lib/views/table/menu_table'
require_relative './lib/views/menu'
