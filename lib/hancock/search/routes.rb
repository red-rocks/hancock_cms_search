module ActionDispatch::Routing
  class Mapper

    def hancock_cms_search_routes(config = {})
      routes_config = {
        use_search_path: true
      }
      routes_config.merge!(config)

      scope module: 'hancock' do
        scope module: 'search' do

          if routes_config[:use_search_path]
            get 'search/(:q)(/page/:page)' => 'search#index', as: :hancock_search
          end
        end
      end

    end

  end
end
