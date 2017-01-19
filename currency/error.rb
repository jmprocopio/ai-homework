class DifferentCurrencyCodeError < Exception
  def initialize(message:)
    @message = message
  end

  def message
    @message
  end
end

class UnknownCurrencyCodeError < Exception
  def initialize(message:)
    @message = message
  end

  def message
    @message
  end
end
