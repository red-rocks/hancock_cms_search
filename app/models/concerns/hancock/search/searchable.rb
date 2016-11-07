module Hancock::Search::Searchable
  extend ActiveSupport::Concern

  module ClassMethods
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
  end

  included do
    scope :fts, -> (query, opts= {}) {
      opts = { "$search": query.to_s}.merge(opts)
      ret = where({"$text": opts})
      ret.options[:fields] = {"score": { "$meta": "textScore" }}
      ret.options[:sort] = {"score": { "$meta": "textScore" }}
      ret
    }
  end

end
