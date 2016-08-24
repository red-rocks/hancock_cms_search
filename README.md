# HancockCMSSearch

Search for [HancockCMS](https://github.com/red-rocks/hancock_cms).
Full text search, relevance

### Remaded from [EnjoyCMSSearch](https://github.com/enjocreative/enjoy_cms_search)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hancock_cms_search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hancock_cms_search

## Usage

Add in config/routes.rb

```ruby
  hancock_cms_search_routes
```

Also you need specify model for search, search method and other. in app/controllers/concerns/hancock/search/decorators/search.rb
```ruby
module Hancock::Search::Decorators
  module Search
    extend ActiveSupport::Concern

    def search_model_class
      YourModel
    end

    def fts_method
      :search
    end

  end
end
```
and add this to your_model.rb
```ruby
include Hancock::Search::Searchable
```
More [here](https://github.com/red-rocks/hancock_cms_search/blob/master/lib/hancock/search/controllers/search.rb) and [there](https://github.com/red-rocks/hancock_cms_search/blob/master/app/models/concerns/hancock/search/searchable.rb)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/red-rocks/hancock_cms_search.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
