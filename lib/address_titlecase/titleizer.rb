module AddressTitlecase
  class Titleizer
    class << self
      US_STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
      TERRITORIES = %w(AS DC FM GU MH MP PW PR VI)
      MILITARY = %w(APO FPO MPO AE AA AP)
      DIRECTIONS = %w(NE NW SE SW)
      COUNTRIES = %w(USA)
      MISC = %w(PO RR)

      REMAIN_UPCASE = US_STATES | TERRITORIES | MILITARY | DIRECTIONS | COUNTRIES | MISC

      def titleize(address, opts)
        address.gsub(/\w+['’]?\w*/) do |word|
          if REMAIN_UPCASE.include?(word.upcase) ||
            opts[:upcase]&.include?(word.upcase)
            word.upcase
          else
            word.capitalize
          end
        end
      end
    end
  end
end

class String
  def address_titlecase(opts = {})
    AddressTitlecase::Titleizer.titleize(self, opts)
  end

  alias_method :address_titleize, :address_titlecase
end