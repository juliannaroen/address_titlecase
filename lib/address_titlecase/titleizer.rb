# frozen_string_literal: true

module AddressTitlecase
  # AddressTitlecase::Titleizer
  # .titleize
  #
  #   Will titlecase a given US address string.
  #   Words that should be overridden can be passed as an overrides hash option.
  #
  #   Ex:
  #     AddressTitlecase::Titleizer.titleize('123 sesame st', overrides: { 'st' => 'ST' }) => '123 Sesame ST'
  class Titleizer
    class << self
      US_STATES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze
      US_TERRITORIES = %w[AS DC FM GU MH MP PW PR VI].freeze

      CA_PROVINCES = %w[AB BC MB NB NL NS ON PE QC SK].freeze
      CA_TERRITORIES = %w[NT NU YT].freeze

      MILITARY = %w[APO FPO MPO AE AA AP].freeze

      DIRECTIONS = %w[NE NW SE SW].freeze
      COUNTRIES = %w[USA].freeze
      MISC = %w[PO RR].freeze

      REMAIN_UPCASE = US_STATES | US_TERRITORIES | CA_PROVINCES | CA_TERRITORIES | MILITARY | DIRECTIONS | COUNTRIES | MISC

      def titleize(address, opts = {})
        overrides = opts['overrides'] || opts[:overrides] || {}
        address.gsub(/[[:alpha:]]+['’]?[[:alpha:]]*/) do |word|
          overriden_word = overrides[word]
          if overriden_word
            overriden_word
          elsif REMAIN_UPCASE.include?(word.upcase) || contains_digits?(word)
            word.upcase
          else
            word.capitalize
          end
        end
      end

      private

      def contains_digits?(word)
        !word.count('0-9').zero?
      end
    end
  end
end

# String
# .address_titlecase
#
#   Allow the AddressTitlecase::Titleizer.titleize method to be called on a String object as `address_titlecase`.
#   Method is also aliased to `address_titleize`.
#
#   Ex:
#     '123 sesame st'.address_titlecase(overrides: {'st' => 'ST'}) => '123 Sesame ST'
class String
  def address_titlecase(opts = {})
    AddressTitlecase::Titleizer.titleize(self, opts)
  end

  alias address_titleize address_titlecase
end
