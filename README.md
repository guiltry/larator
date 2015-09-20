# Larator

The main purpose of this generator are:

1. Give an idea to newcomers how to create a simple CRUD application
2. Make development process faster

## Why ruby

1. Because ruby has [Thor](erikhuda/thor) gem, which really stable, rich feature and used by several other gems (e.g: rails, bundle)
2. Ruby has great [Inflector](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html) library (from rails)
3. Ruby has [Rubygems](https://rubygems.org/) that make delivering process easier

## Installation

    $ gem install larator

## Usage

```
larator generate scaffold user
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec` to run the tests, also run `cucumber` to run [Aruba](cucumber/aruba) test.

## Todo

* Read options from .larator.conf config file
* Read custom template from .larator folder
* Add generator for view, controller, request, etc
* Create gh-pages to explain all features

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/guiltry/larator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

