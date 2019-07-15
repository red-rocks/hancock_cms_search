module Hancock::Search::Searchable
  extend ActiveSupport::Concern
  
  included do

    if Hancock::Search.config.model_settings_support
      include Hancock::Settingable
    end

    if Hancock::Search.config.model_settings_support
      model_setting :search_items_per_page, kind: :integer, default: Hancock::Search.config.items_per_page
      model_setting :search_kaminari_config, kind: :hash, default: Hancock::Search.config.kaminari_config
    end

    scope :fts, -> (query, opts= {}) {
      opts = { "$search": query.to_s}.merge(opts)
      ret = where({"$text": opts})
      ret.options[:fields] = {"score": { "$meta": "textScore" }}
      ret.options[:sort] = {"score": { "$meta": "textScore" }}
      ret
    }

    hancock_search_fts_index
  end

  class_methods do
    def hancock_search_fts_index(*opts)
      if Hancock::Search.mongoid?
        opts = opts.extract_options!
        index(
          {
            name: "text"
          }.merge(opts[:fields] || {}),
          {
            default_language: opts[:default_language] || "russian",
            weights: {
              name: 100
            }.merge(opts[:weights] || {}),
            name: opts[:name]
          }
        )
      end
    end

    def search_items_per_page
      if Hancock::Search.config.model_settings_support
        settings.search_items_per_page
      else
        Hancock::Search.config.items_per_page
      end
    end

    def search_kaminari_config
      if Hancock::Search.config.model_settings_support
        settings.search_kaminari_config
      else
        Hancock::Search.config.kaminari_config
      end
    end
  end


end
