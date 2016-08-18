require "hancock/search/version"
require "hancock/search/configuration"
require "hancock/search/engine"
require "hancock/search/routes"

if Hancock.active_record?
  require 'pg_search'
end

module Hancock::Search
  # Hancock::register_plugin(self)

  class << self
    def orm
      Hancock.orm
    end
    def mongoid?
      Hancock::Search.orm == :mongoid
    end
    def active_record?
      Hancock::Search.orm == :active_record
    end
  end

  module Controllers
    autoload :Search,            'hancock/search/controllers/search'
  end

end
