# Address Titlecase

[![Build Status](https://travis-ci.com/juliannaroen/address_titlecase.svg?token=GqtPi1VKmx9gqq9JuxSW&branch=master)](https://travis-ci.com/juliannaroen/address_titlecase)
[![Gem Version](https://badge.fury.io/rb/address_titlecase.svg)](https://badge.fury.io/rb/address_titlecase)

Titleize US and Canadian addresses so that states, directions, and other abbreviations that would normally be titlecased by [`String#titleize`](https://apidock.com/rails/String/titleize) remain uppercase.

```ruby
> "123 SESAME ST SE, SALEM, OR 97301".address_titlecase
=> "123 Sesame St SE, Salem, OR 97301"
```

## Options

Customize transformations by providing an `overrides` argument where the keys denote the words/abbreviations that should be mapped to specific values.

```ruby
> "123 SESAME ST SE, SALEM, OR 97301".address_titlecase(overrides: { 'ST' => 'ST', 'SE' => 'Se' })
=> "123 Sesame ST Se, Salem, OR 97301"
```

`address_titlecase` is also aliased as `address_titleize`.

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
