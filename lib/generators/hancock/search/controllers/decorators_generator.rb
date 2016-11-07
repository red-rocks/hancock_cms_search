require 'rails/generators'

module Hancock::Search::Controllers
  class DecoratorsGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../../../app/controllers/concerns/hancock/search/decorators', __FILE__)
    argument :controllers, type: :array, default: []

    desc 'Hancock::Search Controllers generator'
    def decorators
      copied = false
      (controllers == ['all'] ? permitted_controllers : controllers & permitted_controllers).each do |c|
        copied = true
        copy_file "#{c}.rb", "app/controllers/concerns/hancock/search/decorators/#{c}.rb"
      end
      puts "U need to set controllers`s name. One of this: #{permitted_controllers.join(", ")}." unless copied
    end

    private
    def permitted_controllers
      ['search']
    end

  end
end
