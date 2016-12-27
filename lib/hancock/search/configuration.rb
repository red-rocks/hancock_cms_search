module Hancock::Search
  include Hancock::PluginConfiguration

  def self.config_class
    Configuration
  end

  class Configuration
    attr_accessor :breadcrumbs_on_rails_support

    attr_accessor :seo_support
    attr_accessor :cache_support

    attr_accessor :pages_support

    def initialize
      @breadcrumbs_on_rails_support = !!defined?(BreadcrumbsOnRails)
      
      @seo_support = !!defined?(Hancock::Seo)
      @cache_support  = !!defined?(Hancock::Cache)

      @pages_support = !!defined?(Hancock::Pages)
    end
  end
end
