require 'rails/generators'

module Hancock::Search
  class ConfigGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'Hancock::Search Config generator'
    def config
      template 'hancock_search.erb', "config/initializers/hancock_search.rb"
    end

  end
end
