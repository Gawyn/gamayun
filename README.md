# Gamayun
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'gamayun'
```

To configure the Devise included in Gamayun, a file in (`config/initializers/devise.rb`) needs to be added with the following content:

```ruby
Devise.setup do |config|
  config.secret_key = YOUR_KEY
end
```

And then execute:
```bash
$ rails gamayun:install:migrations
$ bundle exec rake db:migrate
```

Finally, Gamayun controllers need to be autoloaded everytime that a change is done on routes. To do this, add the folllowing line at the end of your `config/routes.rb`:

```
Gamayun::Engine.load_controllers!
```




## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).








