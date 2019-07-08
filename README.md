# AddressTitlecase

Adds `String#address_titlecase`  to properly titleize US addresses so that states, directions, and other normally abbreviated words remain uppercase.

```ruby
> "123 SESAME ST SE, SALEM, OR 97301".address_titlecase
=> 123 Sesame St SE, Salem, OR 97301
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'address_titlecase'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install address_titlecase

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
