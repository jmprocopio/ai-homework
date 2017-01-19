require './currency.rb'

class CurrencyConverter
  def initialize(rate = {"USD" => 1.0, "EUR" => 0.74, "JPY" => 120})
    @rate = rate
  end

  def rate
    @rate
  end

  def convert(a, b)
    if rate[b] == nil
      #UnknownCurrencyCodeError.message
      begin
        raise UnknownCurrencyCodeError
      rescue
        "something based on a made-up currency"
      end
    else
      x = a.amount * rate[b]/rate[a.code]
    end
  end
end
