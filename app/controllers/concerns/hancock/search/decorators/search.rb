module Hancock::Search::Decorators
  module Search
    extend ActiveSupport::Concern

    # def index
    #   return redirect_to url_for(params) if search_redirecter
    #
    #   if Hancock::Search.config.breadcrumbs_on_rails_support
    #     add_breadcrumb "search",  [:hancock_search],                  if: :insert_breadcrumbs
    #     add_breadcrumb "results", [:hancock_search, {q: params[:q]}], if: :insert_breadcrumbs
    #   end
    #
    #   if params[:q].blank?
    #     @results = []
    #   else
    #     @results = search_scope ? search_scope.page(params[:page]).per(per_page).send(fts_method, query) : []
    #   end
    # end
    #
    # private
    # def search_model_class
    #   Hancock::Pages::Page if Hancock::Search.config.pages_support
    # end
    #
    # def search_scope
    #   search_model_class.enabled if search_model_class
    # end
    # 
    # def fts_method
    #   :fts
    # end
    #
    # def search_redirecter
    #   if params[:utf8].present? or params[:submit].present? or params[:commit].present?
    #     params.delete(:utf8)
    #     params.delete(:submit)
    #     params.delete(:commit)
    #     return true
    #   end
    #   false
    # end
    #
    # def insert_breadcrumbs
    #   true
    # end
    #
    # def per_page
    #   10
    # end
    #
    # def query
    #   params[:q].to_s.gsub(/\P{Word}+/, ' ').gsub(/ +/, ' ').strip
    # end

  end
end
