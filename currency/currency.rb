require './error.rb'

class Currency
  def initialize(amount = 0, code="")
    @amount = amount
    @code = code
  end

  def amount
    if @amount.to_s.scan(/["$"]/).join().to_s == "$"
      @amount.scan(/[.0-9]/).join().to_f
    elsif @amount.to_s.scan(/["€"]/).join().to_s == "€"
      @amount.scan(/[.0-9]/).join().to_f
    else
      @amount.to_f
    end
  end

  def code
    if @amount.to_s.scan(/["$"]/).join().to_s == "$"
      @code = "USD"
    elsif @amount.to_s.scan(/["€"]/).join().to_s == "€"
      @code = "EUR"
    else
      @code
    end
  end

  #Make changes based on what came in

  #Is one currency object equal to the other?
  def is_equal?(a)
    @amount == a.amount && @code == a.code
  end

  #Add currencies if they are the same
  def add(a)
    if @code == a.code
      x = @amount + a.amount
    else
      #DifferentCurrencyCodeError.message
      begin
        raise DifferentCurrencyCodeError
      rescue
        "ERROR = can't add"
      end
    end
  end

  #Subtract currencies if they are the same
  def subtract(a)
    if @code == a.code
      x = @amount - a.amount
    else
      #DifferentCurrencyCodeError.message
      begin
        raise DifferentCurrencyCodeError
      rescue
        "ERROR = can't subtract"
      end
    end
  end

  def multiply(a)
    @amount = amount * a
  end

end
