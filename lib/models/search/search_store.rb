# frozen_string_literal: true

class SearchStore
  DB_SEARCHES = ENV['DB_SEARCH_PATH'] || 'search.yml'

  class << self
    def save; end
  end
end
