module Hancock::Search
  include Hancock::PluginConfiguration

  def self.config_class
    Configuration
  end

  class Configuration
    attr_accessor :breadcrumbs_on_rails_support

    attr_accessor :pages_support

    def initialize
      @breadcrumbs_on_rails_support = defined?(BreadcrumbsOnRails)

      @pages_support = defined?(Hancock::Pages)
    end
  end
end
