# frozen_string_literal: true

# AddressTitlecase::Titleizer.titleize
#   Will titlecase a given US address string.
#   Words that should be overridden can be passed as an overrides hash option.
#   Ex:
#     AddressTitlecase::Titleizer.titleize('123 sesame st', overrides: { 'st' => 'ST' }) => '123 Sesame ST'

module AddressTitlecase
  class Titleizer
    class << self
      US_STATES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze
      TERRITORIES = %w[AS DC FM GU MH MP PW PR VI].freeze
      MILITARY = %w[APO FPO MPO AE AA AP].freeze
      DIRECTIONS = %w[NE NW SE SW].freeze
      COUNTRIES = %w[USA].freeze
      MISC = %w[PO RR].freeze

      REMAIN_UPCASE = US_STATES | TERRITORIES | MILITARY | DIRECTIONS | COUNTRIES | MISC

      def titleize(address, opts)
        overrides = opts['overrides'] || opts[:overrides] || {}
        address.gsub(/\w+['’]?\w*/) do |word|
          overriden_word = overrides[word]
          if overriden_word
            overriden_word
          elsif REMAIN_UPCASE.include?(word.upcase)
            word.upcase
          else
            word.capitalize
          end
        end
      end
    end
  end
end

# String.address_titlecase
#   Allow the AddressTitlecase::Titleizer.titleize method to be called on a String object as `address_titlecase`.
#   Method is also aliased to `address_titleize`.
#   Ex:
#     '123 sesame st'.address_titlecase(overrides: {'st' => 'ST'}) => '123 Sesame ST'

class String
  def address_titlecase(opts = {})
    AddressTitlecase::Titleizer.titleize(self, opts)
  end

  alias address_titleize address_titlecase
end
