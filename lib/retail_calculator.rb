class RetailCalculator

  STATE_TAXES = {
    'UT' => 0.0685
  }

  def self.calculate(items, item_price = 1, state_code = '')
    total = items * item_price
    discount = discount_for(total)
    tax = state_tax(state_code)
    result = total * (1.0 - discount)
    result * (1.0 - tax)
  end

  def self.discount_for(amount)
    case amount
    when 0..1000
      0.00
    when 1001..5001
      0.03
    when 5001..10000
      0.05
    when 10001..50000
      0.10
    when 50001..10000000
      0.15
    else
      0.15
    end
  end

  def self.state_tax(state_code)
    STATE_TAXES[state_code] || 0.0
  end
end
