def stock_picker(days)

  buy_sell = []
  $sum = 0

  def stock(days, sub_days, sum, buy_sell)
    temp = sub_days.map { |day| day - sub_days[0]}.max
    if temp > $sum
      buy_sell[0] = days.index(sub_days.min)
      buy_sell[1] = days.index(sub_days.max)
      $sum = temp
    end
    return $sum
  end

  while days.length > 1
    sub_days = days.values_at(days.index(days.min)..-1)
    stock(days, sub_days, $sum, buy_sell)
    days.delete(days.min)
  end

  return buy_sell

end
