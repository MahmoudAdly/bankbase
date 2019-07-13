class FetchExchangeRate
  def initialize(source_currency, target_currency)
    @source_currency = source_currency
    @target_currency = target_currency
  end

  def call
    # TODO: use an external service or gem to fetch this value
    1
  end
end
