module Hancock::Search
  class SearchController < ApplicationController
    include Hancock::Search::Controllers::Search

    include Hancock::Search::Decorators::Search
  end
end
