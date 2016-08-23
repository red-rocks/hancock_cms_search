require "hancock/search/version"
require "hancock/search/configuration"
require "hancock/search/engine"
require "hancock/search/routes"

if Hancock.active_record?
  require 'pg_search'
end

module Hancock::Search
  include Hancock::Plugin

  module Controllers
    autoload :Search,            'hancock/search/controllers/search'
  end

end
